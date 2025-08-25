// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:http/http.dart';
import 'package:wibbo_api/models/wix_produit.dart';
import 'package:wibbo_api/models/wix_variante.dart';
import 'package:wibbo_api/services/logger_service.dart';

abstract class WixRepository {
  Future<WixProduit?> recupereProduitParSku({
    required String sku,
    required String siteId,
    required String apiKey,
    String? skuVariant,
  });
  Future<WixVariante?> recupereVariationParSku({
    required String sku,
    required String siteId,
    required String apiKey,
  });
  Future<void> decrementeStock({
    required String productId,
    required String variantId,
    required int quantity,
    required String siteId,
    required String apiKey,
  });
  Future<String> creerProduit({
    required WixProduit produit,
    required String siteId,
    required String apiKey,
  });

  Future<void> mettreAJourProduit({
    required WixProduit produit,
    required String siteId,
    required String apiKey,
  });

  Future<void> decalreListeVariants({
    required List<Map<String, dynamic>> variants,
    required String productId,
    required String siteId,
    required String apiKey,
  });

  Future<void> supprimerTousVariants({
    required String productId,
    required String siteId,
    required String apiKey,
  });
}

class WixAPIVOneRepository implements WixRepository {
  final urlWix = 'https://www.wixapis.com/stores/v1';
  final urlWixV2 = 'https://www.wixapis.com/stores/v2';

  @override
  Future<WixProduit?> recupereProduitParSku({
    required String sku,
    required String siteId,
    required String apiKey,
    String? skuVariant,
  }) async {
    final body = {
      'includeVariants': true,
    };

    final request = Request(
        'POST', Uri.parse('$urlWix/products/query?includeHiddenProducts=true'),)
      ..headers['Content-Type'] = 'application/json'
      ..headers['wix-site-id'] = siteId
      ..headers['Authorization'] = apiKey
      ..body = jsonEncode(body);

    final response = await Response.fromStream(await Client().send(request));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      if ((data['products'] as List<dynamic>).isEmpty) {
        return null;
      }

      // final produitData =
      //     (data['products'] as List<dynamic>).first as Map<String, dynamic>;

      final listeProduits = (data['products'] as List<dynamic>).map(
        (e) {
          LoggerService.info(
            'Liste des produits: ${e['sku']}',
            'WixAPIRepository',
          );
          return WixProduit.fromJson(e as Map<String, dynamic>);
        },
      ).toList();

      LoggerService.info(
        'Recher du sku $sku',
        'WixAPIRepository',
      );

      // Recherche d'abord par le SKU du produit principal
      var produit = listeProduits.where((produit) => produit.sku?.trim() == sku.trim()).firstOrNull;
      
      if(skuVariant == null) {
        return null;
      }
      // Si pas trouvé, rechercher dans les variants des produits
      // ignore: join_return_with_assignment
      produit ??= listeProduits.where((produit) {
        LoggerService.info(
          'Recherche dans les variants du produit ${produit.sku}',
          'WixAPIRepository',
        );
          // Vérifier si le produit a des variants
          if (produit.variants == null || produit.variants!.isEmpty) {
            return false;
          }
          
          // Chercher dans chaque variant si le SKU correspond
          return produit.variants!.any((variant) => 
            variant.variant?.sku?.trim() == skuVariant?.trim(),
          );
        }).firstOrNull;
      
      return produit;
    } else {
      throw Exception(
        'Erreur lors de la création de la vente: ${response.statusCode} '
        '\n${response.headers}'
        '\n${response.body}',
      );
    }
  }

  @override
  Future<WixVariante?> recupereVariationParSku({
    required String sku,
    required String siteId,
    required String apiKey,
  }) async {
    final body = {
      'paging': {'limit': 1},
    };
    final request = Request('POST', Uri.parse('$urlWix/variants/query'))
      ..headers['Content-Type'] = 'application/json'
      ..headers['wix-site-id'] = siteId
      ..headers['Authorization'] = apiKey
      ..body = jsonEncode(body);

    final response = await Response.fromStream(await Client().send(request));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final varianteData = data['variants'] as List<dynamic>;
      for (final variante in varianteData) {
        final varianteDataMap = variante as Map<String, dynamic>;
        if (varianteDataMap['sku'] == sku) {
          final wixVariante = WixVariante.fromJson(varianteDataMap);
          return wixVariante;
        }
      }
      return null;
    } else {
      throw Exception(
        'Erreur lors de la création de la vente: ${response.statusCode} '
        '\n${response.headers}'
        '\n${response.body}',
      );
    }
  }

  @override
  Future<WixVariante?> decrementeStock({
    required String productId,
    required String variantId,
    required int quantity,
    required String siteId,
    required String apiKey,
  }) async {
    final body = {
      'decrementData': [
        {
          'productId': productId,
          'variantId': variantId,
          'decrementBy': quantity,
        }
      ],
    };
    final request =
        Request('POST', Uri.parse('$urlWixV2/inventoryItems/decrement'))
          // Request('POST', Uri.parse('https://httpbin.org/post'))
          ..headers['Content-Type'] = 'application/json'
          ..headers['wix-site-id'] = siteId
          ..headers['Authorization'] = apiKey
          ..body = jsonEncode(body);

    final response = await Response.fromStream(await Client().send(request));

    if (response.statusCode == 200) {
      return null;
    } else {
      throw Exception(
        'Erreur lors de la décrémentation de stock: ${response.statusCode} '
        '\n${response.headers}'
        '\n${response.body}',
      );
    }
  }

  @override
  Future<String> creerProduit({
    required WixProduit produit,
    required String siteId,
    required String apiKey,
  }) async {
    final bodyVariable = {
      'product': {
        'name': produit.name,
        'productType': 'physical',
        'visible': false,
        'priceData': {
          'price': 25.00,
          'currency': 'EUR',
        },
        'manageVariants': true,
        'sku': produit.sku,
        'description': produit.description,
        'productOptions':
            produit.productOptions?.map((e) => e.toJson()).toList(),
      },
    };
    final bodySimple = {
      'product': {
        'name': produit.name,
        'productType': 'physical',
        'visible': false,
        'priceData': {
          'price': 25.00,
          'currency': 'EUR',
        },
        'sku': produit.sku,
        'description': produit.description,
      },
    };
    final request = Request('POST', Uri.parse('$urlWix/products'))
      //Request('POST', Uri.parse('https://httpbin.org/post'))
      ..headers['Content-Type'] = 'application/json'
      ..headers['wix-site-id'] = siteId
      ..headers['Authorization'] = apiKey
      ..body = jsonEncode(produit.isVariable ? bodyVariable : bodySimple);

    final response = await Response.fromStream(await Client().send(request));

    if (response.statusCode == 200) {
      LoggerService.info(
        'Produit créé avec succès ${response.body}',
        'WixAPIRepository',
      );
      final data = json.decode(response.body) as Map<String, dynamic>;
      return (data['product'] as Map<String, dynamic>)['id'] as String;
    } else {
      throw Exception(
        'Erreur lors de la création de produit: ${response.statusCode} '
        '\n${response.headers}'
        '\n${response.body}',
      );
    }
  }

  @override
  Future<void> mettreAJourProduit({
    required WixProduit produit,
    required String siteId,
    required String apiKey,
  }) async {
    final bodyVariable = {
      'product': {
        'name': produit.name,
        'productType': 'physical',
        'visible': false,
        'priceData': {
          'price': 25.00,
          'currency': 'EUR',
        },
        'manageVariants': true,
        'sku': produit.sku,
        'description': produit.description,
        // 'productOptions':
        //     produit.productOptions?.map((e) => e.toJson()).toList(),
      },
    };
    final bodySimple = {
      'product': {
        'name': produit.name,
        'productType': 'physical',
        'visible': false,
        'priceData': {
          'price': 25.00,
          'currency': 'EUR',
        },
        'sku': produit.sku,
        'description': produit.description,
      },
    };
    final request =
        Request('PATCH', Uri.parse('$urlWix/products/${produit.id}'))
          //   Request('POST', Uri.parse('https://httpbin.org/post'))
          ..headers['Content-Type'] = 'application/json'
          ..headers['wix-site-id'] = siteId
          ..headers['Authorization'] = apiKey
          ..body = jsonEncode(produit.isVariable ? bodyVariable : bodySimple);

    final response = await Response.fromStream(await Client().send(request));

    if (response.statusCode == 200) {
      LoggerService.info(
        'Produit créé avec succès ${response.body}',
        'WixAPIRepository',
      );
      return;
    } else {
      throw Exception(
        'Erreur lors de la création de produit: ${response.statusCode} '
        '\n${response.headers}'
        '\n${response.body}',
      );
    }
  }

  @override
  Future<void> decalreListeVariants({
    required List<Map<String, dynamic>> variants,
    required String productId,
    required String siteId,
    required String apiKey,
  }) async {
    final body = {
      'variants': variants,
    };

    final request =
        Request('PATCH', Uri.parse('$urlWix/products/$productId/variants'))
          //Request('POST', Uri.parse('https://httpbin.org/post'))
          ..headers['Content-Type'] = 'application/json'
          ..headers['wix-site-id'] = siteId
          ..headers['Authorization'] = apiKey
          ..body = jsonEncode(body);

    final response = await Response.fromStream(await Client().send(request));

    if (response.statusCode == 200) {
      LoggerService.info(
        'Liste des variants déclarée avec succès ${response.body}',
        'WixAPIRepository',
      );
      return;
    } else {
      throw Exception(
        'Erreur lors de la déclaration de la liste des variants: ${response.statusCode} '
        '\n${response.headers}'
        '\n${response.body}',
      );
    }
  }

  @override
  Future<void> supprimerTousVariants({
    required String productId,
    required String siteId,
    required String apiKey,
  }) async {
    final body = {
      // ignore: inference_failure_on_collection_literal
      'variants': [],
    };

    final request =
        Request('PATCH', Uri.parse('$urlWix/products/$productId/variants'))
          ..headers['Content-Type'] = 'application/json'
          ..headers['wix-site-id'] = siteId
          ..headers['Authorization'] = apiKey
          ..body = jsonEncode(body);

    final response = await Response.fromStream(await Client().send(request));

    if (response.statusCode == 200) {
      LoggerService.info(
        'Tous les variants du produit $productId ont été supprimés avec succès',
        'WixAPIRepository',
      );
      return;
    } else {
      throw Exception(
        'Erreur lors de la suppression de tous les variants: ${response.statusCode} '
        '\n${response.headers}'
        '\n${response.body}',
      );
    }
  }
}
