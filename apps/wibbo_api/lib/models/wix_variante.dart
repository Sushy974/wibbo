// ignore_for_file: public_member_api_docs

import 'package:wibbo_api/services/cast_service.dart';

class WixVariante {
  WixVariante({
    this.id,
    this.variantId,
    this.productId,
    this.variantName,
    this.productName,
    this.managedVariant,
    this.sku,
    this.stock,
    this.choices,
    this.collectionIds,
    this.media,
    this.customFields,
    this.preorderInfo,
  });

  factory WixVariante.fromJson(Map<String, dynamic> json) {
    try {
      final id = CastService.toStringValue(json['id']);

      final variantId = CastService.toStringValue(json['variantId']);

      final productId = CastService.toStringValue(json['productId']);

      final variantName = CastService.toStringValue(json['variantName']);

      final productName = CastService.toStringValue(json['productName']);

      final managedVariant = CastService.toBool(json['managedVariant']);

      final sku = CastService.toStringValue(json['sku']);

      final stock = json['stock'] != null
          ? WixStock.fromJson(json['stock'] as Map<String, dynamic>)
          : null;

      final choices = json['choices'] != null
          ? Map<String, dynamic>.from(json['choices'] as Map)
          : null;

      final collectionIds = json['collectionIds'] != null
          ? List<String>.from(json['collectionIds'] as List)
          : null;

      final media = json['media'] != null
          ? WixMedia.fromJson(json['media'] as Map<String, dynamic>)
          : null;

      final customFields = json['customFields'] != null
          ? Map<String, dynamic>.from(json['customFields'] as Map)
          : null;

      final preorderInfo = json['preorderInfo'] != null
          ? WixPreorderInfo.fromJson(
              json['preorderInfo'] as Map<String, dynamic>,
            )
          : null;

      final wixVariante = WixVariante(
        id: id,
        variantId: variantId,
        productId: productId,
        variantName: variantName,
        productName: productName,
        managedVariant: managedVariant,
        sku: sku,
        stock: stock,
        choices: choices,
        collectionIds: collectionIds,
        media: media,
        customFields: customFields,
        preorderInfo: preorderInfo,
      );
      return wixVariante;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  final String? id;
  final String? variantId;
  final String? productId;
  final String? variantName;
  final String? productName;
  final bool? managedVariant;
  final String? sku;
  final WixStock? stock;
  final Map<String, dynamic>? choices;
  final List<String>? collectionIds;
  final WixMedia? media;
  final Map<String, dynamic>? customFields;
  final WixPreorderInfo? preorderInfo;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'variantId': variantId,
      'productId': productId,
      'variantName': variantName,
      'productName': productName,
      'managedVariant': managedVariant,
      'sku': sku,
      'stock': stock?.toJson(),
      'choices': choices,
      'collectionIds': collectionIds,
      'media': media?.toJson(),
      'customFields': customFields,
      'preorderInfo': preorderInfo?.toJson(),
    };
  }
}

class WixStock {
  final bool? trackQuantity;
  final int? quantity;
  final bool? inStock;

  WixStock({
    this.trackQuantity,
    this.quantity,
    this.inStock,
  });

  factory WixStock.fromJson(Map<String, dynamic> json) {
    return WixStock(
      trackQuantity: CastService.toBool(json['trackQuantity']),
      quantity: 0, //CastService.toDouble(json['quantity'])?.toInt(),
      inStock: CastService.toBool(json['inStock']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trackQuantity': trackQuantity,
      'quantity': quantity,
      'inStock': inStock,
    };
  }
}

class WixMedia {
  final WixImage? image;

  WixMedia({
    this.image,
  });

  factory WixMedia.fromJson(Map<String, dynamic> json) {
    return WixMedia(
      image: json['image'] != null
          ? WixImage.fromJson(json['image'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image?.toJson(),
    };
  }
}

class WixImage {
  final String? id;
  final String? url;
  final int? height;
  final int? width;

  WixImage({
    this.id,
    this.url,
    this.height,
    this.width,
  });

  factory WixImage.fromJson(Map<String, dynamic> json) {
    return WixImage(
      id: CastService.toStringValue(json['id']),
      url: CastService.toStringValue(json['url']),
      height: 0, //CastService.toDouble(json['height'])?.toInt(),
      width: 0, //CastService.toDouble(json['width'])?.toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'height': height,
      'width': width,
    };
  }
}

class WixPreorderInfo {
  final bool? enabled;

  WixPreorderInfo({
    this.enabled,
  });

  factory WixPreorderInfo.fromJson(Map<String, dynamic> json) {
    return WixPreorderInfo(
      enabled: CastService.toBool(json['enabled']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
    };
  }
}
