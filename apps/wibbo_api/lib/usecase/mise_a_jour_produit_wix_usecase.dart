// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:wibbo_api/models/compte_utilisateur.dart';
import 'package:wibbo_api/models/hiboutik_product.dart';
import 'package:wibbo_api/models/stock_produit_hiboutik.dart';
import 'package:wibbo_api/models/wix_produit.dart';
import 'package:wibbo_api/repository/compte_utilisateur_repository.dart';
import 'package:wibbo_api/repository/hiboutik_repository.dart';
import 'package:wibbo_api/repository/wix_repository.dart';
import 'package:wibbo_api/services/logger_service.dart';

class MiseAJourProduitWixUsecase {
  MiseAJourProduitWixUsecase({
    required WixRepository wixRepository,
    required HiboutikRepository hiboutikRepository,
    required CompteUtilisateurRepository compteUtilisateurRepository,
  }) : 
  _wixRepository = wixRepository,
        _hiboutikRepository = hiboutikRepository,
        _compteUtilisateurRepository = compteUtilisateurRepository;

  final WixRepository _wixRepository;
  final HiboutikRepository _hiboutikRepository;
  final CompteUtilisateurRepository _compteUtilisateurRepository;

  Future<void> execute(MiseAJourProduitWixCommand command) async {
    LoggerService.info(
      'Début de mise à jour produit Wix',
      'MiseAJourProduitWixUsecase',
    );
    LoggerService.debug(
      'ProductID: ${command.productId}, UID utilisateur: ${command.uidCompteUtilisateur}',
      'MiseAJourProduitWixUsecase',
    );

    final compte = await _compteUtilisateurRepository.recupereCompteUtilisateur(
      uid: command.uidCompteUtilisateur,
    );
    LoggerService.info(
      'Compte utilisateur récupéré: ${compte.hiboutikEmail}',
      'MiseAJourProduitWixUsecase',
    );

    final listeProducts = await _hiboutikRepository.getProducts(
      urlHiboutik: compte.urlHiboutik,
      vendorId: compte.hiboutikIdVendeur,
      username: compte.hiboutikEmail,
      password: compte.hiboutikMotDePasse,
    );
    LoggerService.debug(
      'Nombre de produits récupérés depuis Hiboutik: ${listeProducts.length}',
      'MiseAJourProduitWixUsecase',
    );

    final product = listeProducts
        .where(
          (element) =>
              element.productId.toString().trim() == command.productId.trim(),
        )
        .firstOrNull;
    if (product == null) {
      LoggerService.error(
        'Produit non trouvé dans Hiboutik',
        null,
        null,
        'MiseAJourProduitWixUsecase',
      );
      throw Exception(
        'Produit non trouvé dans la collection'
        ' d hiboutik avec l if ${command.productId}',
      );
    }
    LoggerService.info(
      'Produit trouvé - ID: ${product.productId}, Modèle: ${product.productModel}',
      'MiseAJourProduitWixUsecase',
    );

    final stockHiboutik = await _hiboutikRepository.getStock(
      urlHiboutik: compte.urlHiboutik,
      vendorId: compte.hiboutikIdVendeur,
      username: compte.hiboutikEmail,
      password: compte.hiboutikMotDePasse,
      sku: product.productBarcode,
    );
    LoggerService.debug(
      'Stock récupéré - SKU: ${product.productBarcode}, Stock disponible: ${stockHiboutik.stockAvailable}',
      'MiseAJourProduitWixUsecase',
    );

    if (product.isProductSimple) {
      LoggerService.info(
        'Traitement produit simple',
        'MiseAJourProduitWixUsecase',
      );
      await _miseAJourProduitSimple(
        product: product,
        compteUtilisateur: compte,
        stockHiboutik: stockHiboutik,
      );
      LoggerService.info(
        'Mise à jour produit simple terminée',
        'MiseAJourProduitWixUsecase',
      );
      return;
    } else {
      LoggerService.info(
        'Traitement produit variable',
        'MiseAJourProduitWixUsecase',
      );
      await _miseAJourProduitVariable(
        product: product,
        compteUtilisateur: compte,
        stockHiboutik: stockHiboutik,
      );
      LoggerService.info(
        'Mise à jour produit variable terminée',
        'MiseAJourProduitWixUsecase',
      );
      return;
    }
  }

  Future<void> _miseAJourProduitSimple({
    required HiboutikProduct product,
    required CompteUtilisateur compteUtilisateur,
    required StockProduitHiboutik stockHiboutik,
  }) async {
    LoggerService.debug(
      'Recherche produit Wix par SKU: ${product.productBarcode}',
      'MiseAJourProduitWixUsecase',
    );

    final produitWix = await _wixRepository.recupereProduitParSku(
      sku: product.productBarcode,
      siteId: compteUtilisateur.wixSiteId,
      apiKey: compteUtilisateur.wixApiKey,
    );

    if (produitWix == null) {
      LoggerService.info(
        'Produit Wix non trouvé, création nécessaire - SKU: ${product.productBarcode}',
        'MiseAJourProduitWixUsecase',
      );
      //TODO creation produit
      final nouvelProduitWix = WixProduit(
        name: product.productModel,
        description: product.productsDesc,
        sku: product.productBarcode,
        price: WixPrice(
          currency: 'EUR',
          price: double.parse(product.productPrice),
          formatted: WixFormattedPrice(
            price: '${product.productPrice} €',
            discountedPrice: '${product.productDiscountPrice} €',
          ),
        ),
        stock: WixProductStock(
          inStock: true,
          inventoryStatus: 'IN_STOCK',
          quantity: stockHiboutik.stockAvailable,
          trackInventory: true,
        ),
      );
      LoggerService.info(
        'Nouveau produit Wix préparé pour création',
        'MiseAJourProduitWixUsecase',
      );
      await _wixRepository.creerProduit(
        produit: nouvelProduitWix,
        siteId: compteUtilisateur.wixSiteId,
        apiKey: compteUtilisateur.wixApiKey,
      );
      LoggerService.info(
        'Produit Wix créé avec succès',
        'MiseAJourProduitWixUsecase',
      );
      return;
    }
    LoggerService.info(
      'Produit Wix trouvé - ID: ${produitWix.id}',
      'MiseAJourProduitWixUsecase',
    );

    final produitWixMiseAJour = produitWix.copyWith(
      name: product.productModel,
      description: product.productsDesc,
      price: produitWix.price?.copyWith(
        price: double.parse(product.productPrice),
        discountedPrice: double.parse(product.productDiscountPrice),
        formatted: produitWix.price?.formatted?.copyWith(
          price: '${product.productPrice} €',
          discountedPrice: '${product.productDiscountPrice} €',
        ),
      ),
    );
    await _wixRepository.mettreAJourProduit(
      produit: produitWixMiseAJour,
      siteId: compteUtilisateur.wixSiteId,
      apiKey: compteUtilisateur.wixApiKey,
    );
    LoggerService.info(
      'Produit Wix mis à jour avec succès',
      'MiseAJourProduitWixUsecase',
    );
    return;
  }

  Future<void> _miseAJourProduitVariable({
    required HiboutikProduct product,
    required CompteUtilisateur compteUtilisateur,
    required StockProduitHiboutik stockHiboutik,
  }) async {
    final produitWix = await _wixRepository.recupereProduitParSku(
      skuVariant: product.productSizeDetails?.first.barcode,
      sku: product.productBarcode,
      siteId: compteUtilisateur.wixSiteId,
      apiKey: compteUtilisateur.wixApiKey,
    );

    if (produitWix == null) {
      LoggerService.info(
        'Produit Wix non trouvé, création nécessaire '
            '- SKU: ${product.productBarcode}',
        'MiseAJourProduitWixUsecase',
      );
      final listeChoices = product.productSizeDetails!
          .map(
            (size) => WixProductChoice(
              description: size.sizeName,
              value: size.sizeName,
            ),
          )
          .toList();
      final nouvelProduitWix = WixProduit(
        name: product.productModel,
        description: product.productsDesc,
        sku: product.productBarcode,
        price: WixPrice(
          currency: 'EUR',
          price: double.parse(product.productPrice),
          formatted: WixFormattedPrice(
            price: '${product.productPrice} €',
            discountedPrice: '${product.productDiscountPrice} €',
          ),
        ),
        stock: WixProductStock(
          inStock: true,
          inventoryStatus: 'IN_STOCK',
          quantity: stockHiboutik.stockAvailable,
          trackInventory: true,
        ),
        productOptions: [
          WixProductOption(
            name: 'Choice',
            choices: listeChoices,
          ),
        ],
      );
      LoggerService.info(
        'Creation produit variable avec ${nouvelProduitWix.productOptions?.first.choices?.length} choix',
        'MiseAJourProduitWixUsecase',
      );
      final idProduit = await _wixRepository.creerProduit(
        produit: nouvelProduitWix,
        siteId: compteUtilisateur.wixSiteId,
        apiKey: compteUtilisateur.wixApiKey,
      );
      LoggerService.info(
        'Déclaration liste des variants pour le produit $idProduit',
        'MiseAJourProduitWixUsecase',
      );
      await _wixRepository.decalreListeVariants(
        variants: product.productSizeDetails!
            .map(
              (e) => <String, dynamic>{
                'choices': {
                  'Choice': e.sizeName,
                },
                'sku': e.barcode,
                'priceData': {'price': double.parse(product.productPrice)},
              },
            )
            .toList(),
        productId: idProduit,
        siteId: compteUtilisateur.wixSiteId,
        apiKey: compteUtilisateur.wixApiKey,
      );
      LoggerService.info(
        'Produit Wix créé avec succès',
        'MiseAJourProduitWixUsecase',
      );
      return;
    }
    LoggerService.info(
      'Produit Wix trouvé - ID: ${produitWix.id}',
      'MiseAJourProduitWixUsecase',
    );

    final produitWixMiseAJour = produitWix.copyWith(
      name: product.productModel,
      description: product.productsDesc,
      price: produitWix.price?.copyWith(
        price: double.parse(product.productPrice),
        discountedPrice: double.parse(product.productDiscountPrice),
        formatted: produitWix.price?.formatted?.copyWith(
          price: '${product.productPrice} €',
          discountedPrice: '${product.productDiscountPrice} €',
        ),
      ),
      productOptions: [
        WixProductOption(
          name: 'Choice',
          choices: product.productSizeDetails!
              .map(
                (size) => WixProductChoice(
                  description: size.sizeName,
                  value: size.sizeName,
                ),
              )
              .toList(),
        ),
      ],
    );
    await _wixRepository.supprimerTousVariants(
      productId: produitWixMiseAJour.id!,
      siteId: compteUtilisateur.wixSiteId,
      apiKey: compteUtilisateur.wixApiKey,
    );
    await _wixRepository.mettreAJourProduit(
      produit: produitWixMiseAJour,
      siteId: compteUtilisateur.wixSiteId,
      apiKey: compteUtilisateur.wixApiKey,
    );
    LoggerService.info(
      'Déclaration liste des variants pour le produit ${product.productId}',
      'MiseAJourProduitWixUsecase',
    );
    await _wixRepository.decalreListeVariants(
      variants: product.productSizeDetails!
          .map(
            (e) => <String, dynamic>{
              'choices': {
                'Choice': e.sizeName,
              },
              'sku': e.barcode,
              'priceData': {'price': double.parse(product.productPrice)},
            },
          )
          .toList(),
      productId: produitWixMiseAJour.id!,
      siteId: compteUtilisateur.wixSiteId,
      apiKey: compteUtilisateur.wixApiKey,
    );
    LoggerService.info(
      'Produit Wix mis à jour avec succès',
      'MiseAJourProduitWixUsecase',
    );
    return;
  }
}

class MiseAJourProduitWixCommand {
  MiseAJourProduitWixCommand({
    required this.productId,
    required this.uidCompteUtilisateur,
  });
  final String productId;
  final String uidCompteUtilisateur;
}
