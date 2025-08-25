// ignore_for_file: depend_on_referenced_packages, public_member_api_docs

import 'dart:convert';

import 'package:http/http.dart';
import 'package:wibbo_api/models/hiboutik_product.dart';
import 'package:wibbo_api/models/hiboutik_sale.dart';
import 'package:wibbo_api/models/stock_produit_hiboutik.dart';

abstract class HiboutikRepository {
  Future<HiboutikSale> createSale({
    required String urlHiboutik,
    required String vendorId,
    required String username,
    required String password,
    String storeId = '1',
  });
  Future<HiboutikSale> getSale({
    required String urlHiboutik,
    required String username,
    required String password,
    required String saleId,
  });

  Future<List<HiboutikProduct>> getProducts({
    required String urlHiboutik,
    required String vendorId,
    required String username,
    required String password,
    String? sku,
  });

  Future<void> ajouteProduitALaVente({
    required String urlHiboutik,
    required String vendorId,
    required String username,
    required String password,
    required String saleId,
    required String productId,
    required String quantity,
    required String sizeId,
  });
  Future<StockProduitHiboutik> getStock({
    required String urlHiboutik,
    required String vendorId,
    required String username,
    required String password,
    required String sku,
  });
}

class HiboutikApiRepository implements HiboutikRepository {
  const HiboutikApiRepository({
    required Client httpClient,
  }) : _httpClient = httpClient;

  final Client _httpClient;

  Future<String> callWithBasicAuth({
    required String username,
    required String password,
  }) async {
    return base64Encode(utf8.encode('$username:$password'));
  }

  @override
  Future<HiboutikSale> createSale({
    required String urlHiboutik,
    required String vendorId,
    required String username,
    required String password,
    String storeId = '1',
  }) async {
    try {
      final auth = await callWithBasicAuth(
        username: username,
        password: password,
      );

      final requestBody = {
        'store_id': 1,
        'customer_id': 0,
        'duty_free_sale': 0,
        'prices_without_taxes': 0,
        'quotation': 0,
        'currency_code': 'EUR',
        'vendor_id': 3,
      };

      final requestUrl = '$urlHiboutik/sales/';
      final requestHeaders = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Basic $auth',
      };

      final uri = Uri.parse(requestUrl);

      final request = Request('POST', uri)
        ..headers['Content-Type'] = 'application/json'
        ..headers['Accept'] = 'application/json'
        ..headers['Authorization'] = 'Basic $auth'
        ..bodyBytes = utf8.encode(jsonEncode(requestBody));

      final response = await Response.fromStream(await Client().send(request));

      if (response.statusCode == 201) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final saleId = data['sale_id'] as int;
        final sale = await getSale(
          urlHiboutik: urlHiboutik,
          username: username,
          password: password,
          saleId: saleId.toString(),
        );
        return sale;
      } else {
        throw Exception(
          'Erreur lors de la création de la vente: ${response.statusCode} '
          '\n${response.headers}'
          '\n${response.body}',
        );
      }
    } catch (e) {
      throw Exception('Erreur de connexion à Hiboutik: $e');
    }
  }

  @override
  Future<HiboutikSale> getSale({
    required String urlHiboutik,
    required String username,
    required String password,
    required String saleId,
  }) async {
    final auth = await callWithBasicAuth(
      username: username,
      password: password,
    );
    final requestUrl = '$urlHiboutik/sales/$saleId';
    final uri = Uri.parse(requestUrl);

    final request = Request('GET', uri)
      ..headers['Accept'] = '*/*'
      ..headers['Authorization'] = 'Basic $auth';

    final response = await Response.fromStream(await Client().send(request));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      if (data.isNotEmpty) {
        return HiboutikSale.fromJson(data.first as Map<String, dynamic>);
      } else {
        throw Exception("Aucune vente trouvée avec l'ID: $saleId");
      }
    } else {
      throw Exception(
          'Erreur lors de la récupération de la vente: ${response.statusCode}');
    }
  }

  @override
  Future<void> ajouteProduitALaVente({
    required String urlHiboutik,
    required String vendorId,
    required String username,
    required String password,
    required String saleId,
    required String productId,
    required String quantity,
    required String sizeId,
  }) async {
    final auth = await callWithBasicAuth(
      username: username,
      password: password,
    );

    // Utilisation de form-urlencoded au lieu de JSON pour éviter les problèmes d'encodage
    final body = Uri(
      queryParameters: {
        'product_comments': '',
        'quantity': quantity,
        'product_id': productId,
        'sale_id': saleId,
        'product_points': '',
        'serial_number': '',
        'product_price': '',
        'size_id': sizeId,
        'kitchen_pos': '',
        'stock_withdrawal': '',
      },
    ).query;

    final request = Request('POST', Uri.parse('$urlHiboutik/sales/add_product'))
      ..headers['Content-Type'] = 'application/x-www-form-urlencoded'
      ..headers['Accept'] = 'application/json'
      ..headers['Authorization'] = 'Basic $auth'
      ..bodyBytes = utf8.encode(jsonEncode(body));

    final response = await Response.fromStream(await Client().send(request));

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception(
        "Erreur lors de l'ajout du produit à la vente: ${response.statusCode} - ${response.body}",
      );
    }
  }

  @override
  Future<List<HiboutikProduct>> getProducts({
    required String urlHiboutik,
    required String vendorId,
    required String username,
    required String password,
    String? sku,
  }) async {
    final auth = await callWithBasicAuth(
      username: username,
      password: password,
    );
    final response = await _httpClient.get(
      Uri.parse('$urlHiboutik/products'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Basic $auth'
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      if (sku != null) {
        final products = data.map((e) {
          return HiboutikProduct.fromJson(e as Map<String, dynamic>);
        }).toList();
        return products.where((e) => e.productBarcode == sku).toList();
      }
      return data
          .map((e) => HiboutikProduct.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
          'Erreur lors de la récupération du produit: ${response.statusCode}');
    }
  }

  @override
  Future<StockProduitHiboutik> getStock({
    required String urlHiboutik,
    required String vendorId,
    required String username,
    required String password,
    required String sku,
  }) async {
    final auth = await callWithBasicAuth(
      username: username,
      password: password,
    );
    final response = await _httpClient.get(
      Uri.parse('$urlHiboutik/stock_available/warehouse_id/1'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Basic $auth'
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      final stocks = <StockProduitHiboutik>[];
      for (var element in data) {
        stocks.add(
          StockProduitHiboutik.fromJson(element as Map<String, dynamic>),
        );
      }
      return stocks
              .where((element) => element.productBarcode == sku)
              .firstOrNull ??
          StockProduitHiboutik(
            productId: 0,
            productSize: 0,
            warehouseId: 1,
            stockAvailable: 0,
            inventoryAlert: 0,
            productBarcode: sku,
            productSupplierReference: '',
          );
    } else {
      throw Exception(
        'Erreur lors de la récupération du produit: ${response.statusCode}',
      );
    }
  }
}
