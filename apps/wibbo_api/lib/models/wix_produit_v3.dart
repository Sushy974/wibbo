// ignore_for_file: public_member_api_docs

import 'package:wibbo_api/models/wix_produit.dart';
import 'package:wibbo_api/models/wix_variante.dart';
import 'package:wibbo_api/services/cast_service.dart';

class WixProduitApiV3 {
  factory WixProduitApiV3.fromV1Compat(WixProduit p) {
    return WixProduitApiV3(
      id: p.id,
      name: p.name,
      visible: p.visible ?? false,
      productType: p.productType ?? 'physical',
      description: p.description,
      sku: p.sku,
      priceData:
          p.priceData != null ? WixPriceDataApiV3.fromV1(p.priceData!) : null,
      options: p.productOptions != null
          ? p.productOptions!.map((o) => WixOptionApiV3.fromV1(o)).toList()
          : null,
      variants: p.variants != null
          ? p.variants!.map((v) => WixVariantApiV3.fromV1(v)).toList()
          : null,
    );
  }
  WixProduitApiV3({
    this.id,
    this.name,
    this.visible,
    this.productType,
    this.description,
    this.sku,
    this.priceData,
    this.options,
    this.variants,
    this.revision,
  });

  factory WixProduitApiV3.fromJson(Map<String, dynamic> json) {
    return WixProduitApiV3(
      id: CastService.toStringValue(json['id']),
      name: CastService.toStringValue(json['name']),
      visible: CastService.toBool(json['visible']),
      productType: CastService.toStringValue(json['productType']),
      description: CastService.toStringValue(json['description']),
      sku: CastService.toStringValue(json['sku']),
      priceData: json['priceData'] != null
          ? WixPriceDataApiV3.fromJson(
              json['priceData'] as Map<String, dynamic>)
          : null,
      options: json['options'] != null
          ? (json['options'] as List)
              .map((e) => WixOptionApiV3.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      variants: json['variants'] != null
          ? (json['variants'] as List)
              .map((e) => WixVariantApiV3.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      revision: CastService.toStringValue(json['revision']),
    );
  }

  final String? id;
  final String? name;
  final bool? visible;
  final String? productType;
  final String? description;
  final String? sku;
  final WixPriceDataApiV3? priceData;
  final List<WixOptionApiV3>? options;
  final List<WixVariantApiV3>? variants;
  final String? revision;

  Map<String, dynamic> toCreateJson() {
    return {
      'product': {
        'name': name,
        'productType': productType ?? 'physical',
        'visible': visible ?? false,
        'description': description,
        'sku': sku,
        if (priceData != null) 'priceData': priceData!.toJson(),
        if (options != null)
          'options': options!.map((e) => e.toJson()).toList(),
        if (variants != null)
          'variants': variants!.map((e) => e.toJson()).toList(),
      }
    };
  }

  Map<String, dynamic> toUpdateWithInventoryJson() {
    return {
      'product': {
        'id': id,
        'revision': revision,
        if (name != null) 'name': name,
        if (productType != null) 'productType': productType,
        if (visible != null) 'visible': visible,
        if (description != null) 'description': description,
        if (sku != null) 'sku': sku,
        if (priceData != null) 'priceData': priceData!.toJson(),
        if (options != null)
          'options': options!.map((e) => e.toJson()).toList(),
        if (variants != null)
          'variants': variants!.map((e) => e.toJson()).toList(),
      }
    };
  }

  WixProduit toV1Compat() {
    return WixProduit(
      id: id,
      name: name,
      visible: visible,
      productType: productType,
      description: description,
      sku: sku,
      priceData: priceData?.toV1(),
      productOptions: options?.map((e) => e.toV1()).toList(),
      variants: variants?.map((e) => e.toV1()).toList(),
    );
  }

  WixProduitApiV3 copyWith({
    String? id,
    String? name,
    bool? visible,
    String? productType,
    String? description,
    String? sku,
    WixPriceDataApiV3? priceData,
    List<WixOptionApiV3>? options,
    List<WixVariantApiV3>? variants,
    String? revision,
  }) {
    return WixProduitApiV3(
      id: id ?? this.id,
      name: name ?? this.name,
      visible: visible ?? this.visible,
      productType: productType ?? this.productType,
      description: description ?? this.description,
      sku: sku ?? this.sku,
      priceData: priceData ?? this.priceData,
      options: options ?? this.options,
      variants: variants ?? this.variants,
      revision: revision ?? this.revision,
    );
  }
}

class WixPriceDataApiV3 {
  WixPriceDataApiV3.fromV1(WixPriceData v1)
      : currency = v1.currency,
        price = v1.price,
        discountedPrice = v1.discountedPrice;
  WixPriceDataApiV3({this.currency, this.price, this.discountedPrice});
  factory WixPriceDataApiV3.fromJson(Map<String, dynamic> json) {
    return WixPriceDataApiV3(
      currency: CastService.toStringValue(json['currency']),
      price: CastService.toDouble(json['price']),
      discountedPrice: CastService.toDouble(json['discountedPrice']),
    );
  }
  final String? currency;
  final double? price;
  final double? discountedPrice;
  Map<String, dynamic> toJson() => {
        'currency': currency,
        'price': price,
        'discountedPrice': discountedPrice
      };
  WixPriceDataApiV3 copyWith(
          {String? currency, double? price, double? discountedPrice}) =>
      WixPriceDataApiV3(
          currency: currency ?? this.currency,
          price: price ?? this.price,
          discountedPrice: discountedPrice ?? this.discountedPrice);
  WixPriceData toV1() => WixPriceData(
      currency: currency, price: price, discountedPrice: discountedPrice);
}

class WixOptionApiV3 {
  factory WixOptionApiV3.fromV1(WixProductOption v1) => WixOptionApiV3(
        name: v1.name,
        choices: v1.choices?.map((c) => WixChoiceApiV3.fromV1(c)).toList(),
      );
  WixOptionApiV3({this.name, this.choices});
  factory WixOptionApiV3.fromJson(Map<String, dynamic> json) {
    return WixOptionApiV3(
      name: CastService.toStringValue(json['name']),
      choices: json['choices'] != null
          ? (json['choices'] as List)
              .map((e) => WixChoiceApiV3.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
  final String? name;
  final List<WixChoiceApiV3>? choices;
  Map<String, dynamic> toJson() => {
        'name': name,
        if (choices != null)
          'choices': choices!.map((e) => e.toJson()).toList(),
      };
  WixProductOption toV1() => WixProductOption(
        name: name,
        choices: choices?.map((e) => e.toV1()).toList(),
      );
}

class WixChoiceApiV3 {
  factory WixChoiceApiV3.fromV1(WixProductChoice v1) => WixChoiceApiV3(
      description: v1.description ?? v1.value,
      value: v1.value,
      visible: v1.visible,
      inStock: v1.inStock);
  WixChoiceApiV3({this.description, this.value, this.visible, this.inStock});
  factory WixChoiceApiV3.fromJson(Map<String, dynamic> json) {
    return WixChoiceApiV3(
      description: CastService.toStringValue(json['description']),
      value: CastService.toStringValue(json['value']),
      visible: CastService.toBool(json['visible']),
      inStock: CastService.toBool(json['inStock']),
    );
  }
  final String? description;
  final String? value;
  final bool? visible;
  final bool? inStock;
  Map<String, dynamic> toJson() => {
        'description': description ?? value,
        if (visible != null) 'visible': visible,
        if (inStock != null) 'inStock': inStock,
      };
  WixProductChoice toV1() => WixProductChoice(
      description: description,
      value: value,
      visible: visible,
      inStock: inStock);
}

class WixVariantApiV3 {
  factory WixVariantApiV3.fromV1(WixProductVariant v1) => WixVariantApiV3(
        id: v1.id,
        choices: v1.choices,
        sku: v1.variant?.sku,
        priceData: v1.variant?.priceData != null
            ? WixPriceDataApiV3.fromV1(v1.variant!.priceData!)
            : null,
      );
  WixVariantApiV3(
      {this.id, this.productId, this.choices, this.sku, this.priceData});
  factory WixVariantApiV3.fromJson(Map<String, dynamic> json) {
    return WixVariantApiV3(
      id: CastService.toStringValue(json['id']),
      productId: CastService.toStringValue(json['productId']),
      choices: json['choices'] != null
          ? Map<String, dynamic>.from(json['choices'] as Map)
          : null,
      sku: CastService.toStringValue(json['sku']),
      priceData: json['priceData'] != null
          ? WixPriceDataApiV3.fromJson(
              json['priceData'] as Map<String, dynamic>)
          : null,
    );
  }
  final String? id;
  final String? productId;
  final Map<String, dynamic>? choices;
  final String? sku;
  final WixPriceDataApiV3? priceData;
  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (choices != null) 'choices': choices,
        if (sku != null) 'sku': sku,
        if (priceData != null) 'priceData': priceData!.toJson(),
      };
  WixProductVariant toV1() => WixProductVariant(
      id: id,
      choices: choices,
      variant: WixVariantData(sku: sku, priceData: priceData?.toV1()));
}

class WixVarianteApiV3 {
  WixVarianteApiV3({
    this.id,
    this.productId,
    this.sku,
    this.variantName,
    this.choices,
  });

  factory WixVarianteApiV3.fromJson(Map<String, dynamic> json) {
    return WixVarianteApiV3(
      id: CastService.toStringValue(json['id']),
      productId: CastService.toStringValue(json['productId']),
      sku: CastService.toStringValue(json['sku']),
      variantName: CastService.toStringValue(json['variantName']),
      choices: json['choices'] != null
          ? Map<String, dynamic>.from(json['choices'] as Map)
          : null,
    );
  }

  final String? id;
  final String? productId;
  final String? sku;
  final String? variantName;
  final Map<String, dynamic>? choices;

  WixVariante toV1Compat() => WixVariante(
        variantId: id,
        productId: productId,
        sku: sku,
        variantName: variantName,
        choices: choices,
      );
}
