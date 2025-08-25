// ignore_for_file: public_member_api_docs

import 'package:wibbo_api/repository/compte_utilisateur_repository.dart';
import 'package:wibbo_api/repository/hiboutik_repository.dart';
import 'package:wibbo_api/services/logger_service.dart';

class CreerVenteHiboutikUsecase {
  const CreerVenteHiboutikUsecase({
    required HiboutikRepository hiboutikRepository,
    required CompteUtilisateurRepository compteUtilisateurRepository,
  })  : _hiboutikRepository = hiboutikRepository,
        _compteUtilisateurRepository = compteUtilisateurRepository;

  final HiboutikRepository _hiboutikRepository;
  final CompteUtilisateurRepository _compteUtilisateurRepository;

  Future<void> execute(CreerVenteHiboutikCommand command) async {
    LoggerService.info('Début de création de vente Hiboutik', 'CreerVenteHiboutikUsecase');
    LoggerService.debug('UID utilisateur: ${command.uidCompteUtilisateur}', 'CreerVenteHiboutikUsecase');
    LoggerService.debug('Nombre d\'items: ${command.listeItemsMap.length}', 'CreerVenteHiboutikUsecase');
    
    final compte = await _compteUtilisateurRepository.recupereCompteUtilisateur(
      uid: command.uidCompteUtilisateur,
    );
    LoggerService.info('Compte utilisateur récupéré: ${compte.hiboutikEmail}', 'CreerVenteHiboutikUsecase');
    
    final sale = await _hiboutikRepository.createSale(
      urlHiboutik: compte.urlHiboutik,
      password: compte.hiboutikMotDePasse,
      username: compte.hiboutikEmail,
      vendorId: compte.hiboutikIdVendeur,
    );
    LoggerService.info('Vente créée avec ID: ${sale.saleId}', 'CreerVenteHiboutikUsecase');

    for (final item in command.listeItemsMap) {
      final sku = (item['sku'] as String).trim();
      final quantity = item['quantity'] as int;
      LoggerService.debug('Traitement item - SKU: $sku, Quantité: $quantity', 'CreerVenteHiboutikUsecase');
      
      final products = await _hiboutikRepository.getProducts(
        urlHiboutik: compte.urlHiboutik,
        password: compte.hiboutikMotDePasse,
        username: compte.hiboutikEmail,
        vendorId: compte.hiboutikIdVendeur,
        sku: sku,
      );

      // Correction de la logique : on continue seulement si on trouve des produits
      if (products.isEmpty) {
        LoggerService.warning('Aucun produit trouvé pour le SKU: $sku', 'CreerVenteHiboutikUsecase');
        continue;
      }

      final product = products.first;
      LoggerService.debug('Produit trouvé - ID: ${product.productId}, Modèle: ${product.productModel}', 'CreerVenteHiboutikUsecase');

      await _hiboutikRepository.ajouteProduitALaVente(
        urlHiboutik: compte.urlHiboutik,
        password: compte.hiboutikMotDePasse,
        username: compte.hiboutikEmail,
        vendorId: compte.hiboutikIdVendeur,
        saleId: sale.saleId.toString(),
        productId: product.productId.toString(),
        quantity: quantity.toString(),
        sizeId: product.productBarcode,
      );
      LoggerService.info('Produit ajouté à la vente - SKU: $sku, Quantité: $quantity', 'CreerVenteHiboutikUsecase');
    }
    
    LoggerService.info('Création de vente Hiboutik terminée avec succès', 'CreerVenteHiboutikUsecase');
  }
}

class CreerVenteHiboutikCommand {
  const CreerVenteHiboutikCommand({
    required this.uidCompteUtilisateur,
    required this.listeItemsMap,
  });

  final String uidCompteUtilisateur;
  final List<Map<String, dynamic>> listeItemsMap;
}
