// ignore_for_file: public_member_api_docs

import 'package:wibbo_api/repository/compte_utilisateur_repository.dart';
import 'package:wibbo_api/repository/wix_repository.dart';
import 'package:wibbo_api/services/logger_service.dart';

class DecrementeStockWixUsecase {
  DecrementeStockWixUsecase({
    required WixRepository wixRepository,
    required CompteUtilisateurRepository compteUtilisateurRepository,
  })  : _wixRepository = wixRepository,
        _compteUtilisateurRepository = compteUtilisateurRepository;

  final WixRepository _wixRepository;
  final CompteUtilisateurRepository _compteUtilisateurRepository;

  Future<void> execute(DecrementeStockWixCommand command) async {
    LoggerService.info('Début de décrémentation de stock Wix', 'DecrementeStockWixUsecase');
    LoggerService.debug('UID utilisateur: ${command.uidCompteUtilisateur}', 'DecrementeStockWixUsecase');
    
    final compte = await _compteUtilisateurRepository.recupereCompteUtilisateur(
      uid: command.uidCompteUtilisateur,
    );
    LoggerService.info('Compte utilisateur récupéré: ${compte.wixSiteId}', 'DecrementeStockWixUsecase');

    final listeItems = command.jsonReponse['line_items'] as List<dynamic>;
    final listeItemsMap =
        listeItems.map((e) => e as Map<String, dynamic>).toList();
    LoggerService.debug('Nombre d\'items à traiter: ${listeItemsMap.length}', 'DecrementeStockWixUsecase');

    for (final item in listeItemsMap) {
      final sku = item['product_barcode'] as String;
      final quantity = (item['quantity'] as double).toInt();
      LoggerService.debug('Traitement item - SKU: $sku, Quantité: $quantity', 'DecrementeStockWixUsecase');

      //recherche un produit non variable par sku
      final produitEntier =
          await _wixRepository.recupereProduitParSku(
        sku: sku,
        siteId: compte.wixSiteId,
        apiKey: compte.wixApiKey,
      );
      if (produitEntier == null) {
        LoggerService.debug('Produit non variable non trouvé, recherche de variation pour SKU: $sku', 'DecrementeStockWixUsecase');
        final variation = await _wixRepository.recupereVariationParSku(
          sku: sku,
          siteId: compte.wixSiteId,
          apiKey: compte.wixApiKey,
        );
        if (variation == null) {
          LoggerService.warning('Aucun produit trouvé pour le SKU: $sku', 'DecrementeStockWixUsecase');
          continue;
        }
        LoggerService.info('Variation trouvée - ProductID: ${variation.productId}, VariantID: ${variation.variantId}', 'DecrementeStockWixUsecase');
        await _wixRepository.decrementeStock(
          productId: variation.productId ?? '',
          variantId: variation.variantId ?? '',
          quantity: quantity,
          siteId: compte.wixSiteId,
          apiKey: compte.wixApiKey,
        );
        LoggerService.info('Stock décrémenté pour variation - SKU: $sku, Quantité: $quantity', 'DecrementeStockWixUsecase');
        continue;
      }
      LoggerService.info('Produit non variable trouvé - ID: ${produitEntier.id}', 'DecrementeStockWixUsecase');
      await _wixRepository.decrementeStock(
        productId: produitEntier.id ?? '',
        variantId: '00000000-0000-0000-0000-000000000000',
        quantity: quantity,
        siteId: compte.wixSiteId,
        apiKey: compte.wixApiKey,
      );
      LoggerService.info('Stock décrémenté pour produit non variable - SKU: $sku, Quantité: $quantity', 'DecrementeStockWixUsecase');
      continue;
    }
    
    LoggerService.info('Décrémentation de stock Wix terminée avec succès', 'DecrementeStockWixUsecase');
  }
}

class DecrementeStockWixCommand {
  DecrementeStockWixCommand({
    required this.jsonReponse,
    required this.uidCompteUtilisateur,
  });
  final Map<String, dynamic> jsonReponse;
  final String uidCompteUtilisateur;
}
