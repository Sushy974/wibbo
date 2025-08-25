// ignore_for_file: public_member_api_docs

import 'package:wibbo_api/services/cast_service.dart';

class WixProduit {
  WixProduit({
    this.id,
    this.name,
    this.slug,
    this.visible,
    this.productType,
    this.description,
    this.sku,
    this.weight,
    this.weightRange,
    this.stock,
    this.price,
    this.priceData,
    this.convertedPriceData,
    this.priceRange,
    this.costRange,
    this.additionalInfoSections,
    this.ribbons,
    this.media,
    this.customTextFields,
    this.manageVariants,
    this.productOptions,
    this.productPageUrl,
    this.numericId,
    this.inventoryItemId,
    this.discount,
    this.collectionIds,
    this.variants,
    this.lastUpdated,
    this.createdDate,
    this.ribbon,
    this.exportProductId,
  });

  factory WixProduit.fromJson(Map<String, dynamic> json) {
    return WixProduit(
      id: CastService.toStringValue(json['id']),
      name: CastService.toStringValue(json['name']),
      slug: CastService.toStringValue(json['slug']),
      visible: CastService.toBool(json['visible']),
      productType: CastService.toStringValue(json['productType']),
      description: CastService.toStringValue(json['description']),
      sku: CastService.toStringValue(json['sku']),
      weight: CastService.toDouble(json['weight']),
      weightRange: json['weightRange'] != null
          ? WixWeightRange.fromJson(json['weightRange'] as Map<String, dynamic>)
          : null,
      stock: json['stock'] != null
          ? WixProductStock.fromJson(json['stock'] as Map<String, dynamic>)
          : null,
      price: json['price'] != null
          ? WixPrice.fromJson(json['price'] as Map<String, dynamic>)
          : null,
      priceData: json['priceData'] != null
          ? WixPriceData.fromJson(json['priceData'] as Map<String, dynamic>)
          : null,
      convertedPriceData: json['convertedPriceData'] != null
          ? WixPriceData.fromJson(
              json['convertedPriceData'] as Map<String, dynamic>,
            )
          : null,
      priceRange: json['priceRange'] != null
          ? WixPriceRange.fromJson(json['priceRange'] as Map<String, dynamic>)
          : null,
      costRange: json['costRange'] != null
          ? WixPriceRange.fromJson(json['costRange'] as Map<String, dynamic>)
          : null,
      additionalInfoSections: json['additionalInfoSections'] as List<dynamic>?,
      ribbons: json['ribbons'] as List<dynamic>?,
      media: json['media'] != null
          ? WixProductMedia.fromJson(json['media'] as Map<String, dynamic>)
          : null,
      customTextFields: json['customTextFields'] as List<dynamic>?,
      manageVariants: CastService.toBool(json['manageVariants']),
      productOptions: json['productOptions'] != null
          ? (json['productOptions'] as List)
              .map((e) => WixProductOption.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      productPageUrl: json['productPageUrl'] != null
          ? WixProductPageUrl.fromJson(
              json['productPageUrl'] as Map<String, dynamic>,
            )
          : null,
      numericId: CastService.toStringValue(json['numericId']),
      inventoryItemId: CastService.toStringValue(json['inventoryItemId']),
      discount: json['discount'] != null
          ? WixDiscount.fromJson(json['discount'] as Map<String, dynamic>)
          : null,
      collectionIds: json['collectionIds'] != null
          ? List<String>.from(json['collectionIds'] as List)
          : null,
      variants: json['variants'] != null
          ? (json['variants'] as List)
              .map((e) => WixProductVariant.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      lastUpdated: CastService.toStringValue(json['lastUpdated']),
      createdDate: CastService.toStringValue(json['createdDate']),
      ribbon: CastService.toStringValue(json['ribbon']),
      exportProductId: CastService.toStringValue(json['exportProductId']),
    );
  }
  final String? id;
  final String? name;
  final String? slug;
  final bool? visible;
  final String? productType;
  final String? description;
  final String? sku;
  final double? weight;
  final WixWeightRange? weightRange;
  final WixProductStock? stock;
  final WixPrice? price;
  final WixPriceData? priceData;
  final WixPriceData? convertedPriceData;
  final WixPriceRange? priceRange;
  final WixPriceRange? costRange;
  final List<dynamic>? additionalInfoSections;
  final List<dynamic>? ribbons;
  final WixProductMedia? media;
  final List<dynamic>? customTextFields;
  final bool? manageVariants;
  final List<WixProductOption>? productOptions;
  final WixProductPageUrl? productPageUrl;
  final String? numericId;
  final String? inventoryItemId;
  final WixDiscount? discount;
  final List<String>? collectionIds;
  final List<WixProductVariant>? variants;
  final String? lastUpdated;
  final String? createdDate;
  final String? ribbon;
  final String? exportProductId;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'visible': visible,
      'productType': productType,
      'description': description,
      'sku': sku,
      'weight': weight,
      'weightRange': weightRange?.toJson(),
      'stock': stock?.toJson(),
      'price': price?.toJson(),
      'priceData': priceData?.toJson(),
      'convertedPriceData': convertedPriceData?.toJson(),
      'priceRange': priceRange?.toJson(),
      'costRange': costRange?.toJson(),
      'additionalInfoSections': additionalInfoSections,
      'ribbons': ribbons,
      'media': media?.toJson(),
      'customTextFields': customTextFields,
      'manageVariants': manageVariants,
      'productOptions': productOptions?.map((e) => e.toJson()).toList(),
      'productPageUrl': productPageUrl?.toJson(),
      'numericId': numericId,
      'inventoryItemId': inventoryItemId,
      'discount': discount?.toJson(),
      'collectionIds': collectionIds,
      'variants': variants?.map((e) => e.toJson()).toList(),
      'lastUpdated': lastUpdated,
      'createdDate': createdDate,
      'ribbon': ribbon,
      'exportProductId': exportProductId,
    };
  }

  bool get isVariable => productOptions != null && productOptions!.isNotEmpty;
  bool get isSimple => !isVariable;

  WixProduit copyWith({
    String? id,
    String? name,
    String? slug,
    bool? visible,
    String? productType,
    String? description,
    String? sku,
    double? weight,
    WixWeightRange? weightRange,
    WixProductStock? stock,
    WixPrice? price,
    WixPriceData? priceData,
    WixPriceData? convertedPriceData,
    WixPriceRange? priceRange,
    WixPriceRange? costRange,
    List<dynamic>? additionalInfoSections,
    List<dynamic>? ribbons,
    WixProductMedia? media,
    List<dynamic>? customTextFields,
    bool? manageVariants,
    List<WixProductOption>? productOptions,
    WixProductPageUrl? productPageUrl,
    String? numericId,
    String? inventoryItemId,
    WixDiscount? discount,
    List<String>? collectionIds,
    List<WixProductVariant>? variants,
    String? lastUpdated,
    String? createdDate,
    String? ribbon,
    String? exportProductId,
  }) {
    return WixProduit(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      visible: visible ?? this.visible,
      productType: productType ?? this.productType,
      description: description ?? this.description,
      sku: sku ?? this.sku,
      weight: weight ?? this.weight,
      weightRange: weightRange ?? this.weightRange,
      stock: stock ?? this.stock,
      price: price ?? this.price,
      priceData: priceData ?? this.priceData,
      convertedPriceData: convertedPriceData ?? this.convertedPriceData,
      priceRange: priceRange ?? this.priceRange,
      costRange: costRange ?? this.costRange,
      additionalInfoSections:
          additionalInfoSections ?? this.additionalInfoSections,
      ribbons: ribbons ?? this.ribbons,
      media: media ?? this.media,
      customTextFields: customTextFields ?? this.customTextFields,
      manageVariants: manageVariants ?? this.manageVariants,
      productOptions: productOptions ?? this.productOptions,
      productPageUrl: productPageUrl ?? this.productPageUrl,
      numericId: numericId ?? this.numericId,
      inventoryItemId: inventoryItemId ?? this.inventoryItemId,
      discount: discount ?? this.discount,
      collectionIds: collectionIds ?? this.collectionIds,
      variants: variants ?? this.variants,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      createdDate: createdDate ?? this.createdDate,
      ribbon: ribbon ?? this.ribbon,
      exportProductId: exportProductId ?? this.exportProductId,
    );
  }
}

class WixWeightRange {
  WixWeightRange({
    this.minValue,
    this.maxValue,
  });

  factory WixWeightRange.fromJson(Map<String, dynamic> json) {
    return WixWeightRange(
      minValue: (json['minValue'] as num?)?.toDouble(),
      maxValue: (json['maxValue'] as num?)?.toDouble(),
    );
  }
  final double? minValue;
  final double? maxValue;

  Map<String, dynamic> toJson() {
    return {
      'minValue': minValue,
      'maxValue': maxValue,
    };
  }

  WixWeightRange copyWith({
    double? minValue,
    double? maxValue,
  }) {
    return WixWeightRange(
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
    );
  }
}

class WixProductStock {
  WixProductStock({
    this.trackInventory,
    this.inStock,
    this.inventoryStatus,
    this.quantity,
  });

  factory WixProductStock.fromJson(Map<String, dynamic> json) {
    return WixProductStock(
      trackInventory: CastService.toBool(json['trackInventory']),
      inStock: CastService.toBool(json['inStock']),
      inventoryStatus: CastService.toStringValue(json['inventoryStatus']),
      quantity: CastService.toInt(json['quantity']),
    );
  }
  final bool? trackInventory;
  final bool? inStock;
  final String? inventoryStatus;
  final int? quantity;

  Map<String, dynamic> toJson() {
    return {
      'trackInventory': trackInventory,
      'inStock': inStock,
      'inventoryStatus': inventoryStatus,
      'quantity': quantity,
    };
  }

  WixProductStock copyWith({
    bool? trackInventory,
    bool? inStock,
    String? inventoryStatus,
    int? quantity,
  }) {
    return WixProductStock(
      trackInventory: trackInventory ?? this.trackInventory,
      inStock: inStock ?? this.inStock,
      inventoryStatus: inventoryStatus ?? this.inventoryStatus,
      quantity: quantity ?? this.quantity,
    );
  }
}

class WixPrice {
  WixPrice({
    this.currency,
    this.price,
    this.discountedPrice,
    this.formatted,
  });

  factory WixPrice.fromJson(Map<String, dynamic> json) {
    return WixPrice(
      currency: CastService.toStringValue(json['currency']),
      price: CastService.toDouble(json['price']),
      discountedPrice: CastService.toDouble(json['discountedPrice']),
      formatted: json['formatted'] != null
          ? WixFormattedPrice.fromJson(
              json['formatted'] as Map<String, dynamic>,
            )
          : null,
    );
  }
  final String? currency;
  final double? price;
  final double? discountedPrice;
  final WixFormattedPrice? formatted;

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'price': price,
      'discountedPrice': discountedPrice,
      'formatted': formatted?.toJson(),
    };
  }

  WixPrice copyWith({
    String? currency,
    double? price,
    double? discountedPrice,
    WixFormattedPrice? formatted,
  }) {
    return WixPrice(
      currency: currency ?? this.currency,
      price: price ?? this.price,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      formatted: formatted ?? this.formatted,
    );
  }
}

class WixPriceData {
  WixPriceData({
    this.currency,
    this.price,
    this.discountedPrice,
    this.formatted,
  });

  factory WixPriceData.fromJson(Map<String, dynamic> json) {
    return WixPriceData(
      currency: CastService.toStringValue(json['currency']),
      price: CastService.toDouble(json['price']),
      discountedPrice: CastService.toDouble(json['discountedPrice']),
      formatted: json['formatted'] != null
          ? WixFormattedPrice.fromJson(
              json['formatted'] as Map<String, dynamic>,
            )
          : null,
    );
  }
  final String? currency;
  final double? price;
  final double? discountedPrice;
  final WixFormattedPrice? formatted;

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'price': price,
      'discountedPrice': discountedPrice,
      'formatted': formatted?.toJson(),
    };
  }

  WixPriceData copyWith({
    String? currency,
    double? price,
    double? discountedPrice,
    WixFormattedPrice? formatted,
  }) {
    return WixPriceData(
      currency: currency ?? this.currency,
      price: price ?? this.price,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      formatted: formatted ?? this.formatted,
    );
  }
}

class WixFormattedPrice {
  WixFormattedPrice({
    this.price,
    this.discountedPrice,
  });

  factory WixFormattedPrice.fromJson(Map<String, dynamic> json) {
    return WixFormattedPrice(
      price: CastService.toStringValue(json['price']),
      discountedPrice: CastService.toStringValue(json['discountedPrice']),
    );
  }
  final String? price;
  final String? discountedPrice;

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'discountedPrice': discountedPrice,
    };
  }

  WixFormattedPrice copyWith({
    String? price,
    String? discountedPrice,
  }) {
    return WixFormattedPrice(
      price: price ?? this.price,
      discountedPrice: discountedPrice ?? this.discountedPrice,
    );
  }
}

class WixPriceRange {
  WixPriceRange({
    this.minValue,
    this.maxValue,
  });

  factory WixPriceRange.fromJson(Map<String, dynamic> json) {
    return WixPriceRange(
      minValue: (json['minValue'] as num?)?.toDouble(),
      maxValue: (json['maxValue'] as num?)?.toDouble(),
    );
  }
  final double? minValue;
  final double? maxValue;

  Map<String, dynamic> toJson() {
    return {
      'minValue': minValue,
      'maxValue': maxValue,
    };
  }

  WixPriceRange copyWith({
    double? minValue,
    double? maxValue,
  }) {
    return WixPriceRange(
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
    );
  }
}

class WixProductMedia {
  WixProductMedia({
    this.mainMedia,
    this.items,
  });

  factory WixProductMedia.fromJson(Map<String, dynamic> json) {
    return WixProductMedia(
      mainMedia: json['mainMedia'] != null
          ? WixMainMedia.fromJson(json['mainMedia'] as Map<String, dynamic>)
          : null,
      items: json['items'] != null
          ? (json['items'] as List)
              .map((e) => WixMediaItem.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
  final WixMainMedia? mainMedia;
  final List<WixMediaItem>? items;

  Map<String, dynamic> toJson() {
    return {
      'mainMedia': mainMedia?.toJson(),
      'items': items?.map((e) => e.toJson()).toList(),
    };
  }

  WixProductMedia copyWith({
    WixMainMedia? mainMedia,
    List<WixMediaItem>? items,
  }) {
    return WixProductMedia(
      mainMedia: mainMedia ?? this.mainMedia,
      items: items ?? this.items,
    );
  }
}

class WixMainMedia {
  WixMainMedia({
    this.thumbnail,
    this.mediaType,
    this.title,
    this.image,
    this.id,
  });

  factory WixMainMedia.fromJson(Map<String, dynamic> json) {
    return WixMainMedia(
      thumbnail: json['thumbnail'] != null
          ? WixThumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>)
          : null,
      mediaType: CastService.toStringValue(json['mediaType']),
      title: CastService.toStringValue(json['title']),
      image: json['image'] != null
          ? WixImage.fromJson(json['image'] as Map<String, dynamic>)
          : null,
      id: CastService.toStringValue(json['id']),
    );
  }
  final WixThumbnail? thumbnail;
  final String? mediaType;
  final String? title;
  final WixImage? image;
  final String? id;

  Map<String, dynamic> toJson() {
    return {
      'thumbnail': thumbnail?.toJson(),
      'mediaType': mediaType,
      'title': title,
      'image': image?.toJson(),
      'id': id,
    };
  }

  WixMainMedia copyWith({
    WixThumbnail? thumbnail,
    String? mediaType,
    String? title,
    WixImage? image,
    String? id,
  }) {
    return WixMainMedia(
      thumbnail: thumbnail ?? this.thumbnail,
      mediaType: mediaType ?? this.mediaType,
      title: title ?? this.title,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }
}

class WixMediaItem {
  WixMediaItem({
    this.thumbnail,
    this.mediaType,
    this.title,
    this.image,
    this.id,
  });

  factory WixMediaItem.fromJson(Map<String, dynamic> json) {
    return WixMediaItem(
      thumbnail: json['thumbnail'] != null
          ? WixThumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>)
          : null,
      mediaType: CastService.toStringValue(json['mediaType']),
      title: CastService.toStringValue(json['title']),
      image: json['image'] != null
          ? WixImage.fromJson(json['image'] as Map<String, dynamic>)
          : null,
      id: CastService.toStringValue(json['id']),
    );
  }
  final WixThumbnail? thumbnail;
  final String? mediaType;
  final String? title;
  final WixImage? image;
  final String? id;

  Map<String, dynamic> toJson() {
    return {
      'thumbnail': thumbnail?.toJson(),
      'mediaType': mediaType,
      'title': title,
      'image': image?.toJson(),
      'id': id,
    };
  }

  WixMediaItem copyWith({
    WixThumbnail? thumbnail,
    String? mediaType,
    String? title,
    WixImage? image,
    String? id,
  }) {
    return WixMediaItem(
      thumbnail: thumbnail ?? this.thumbnail,
      mediaType: mediaType ?? this.mediaType,
      title: title ?? this.title,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }
}

class WixThumbnail {
  WixThumbnail({
    this.url,
    this.width,
    this.height,
  });

  factory WixThumbnail.fromJson(Map<String, dynamic> json) {
    return WixThumbnail(
      url: CastService.toStringValue(json['url']),
      width: CastService.toInt(json['width']),
      height: CastService.toInt(json['height']),
    );
  }
  final String? url;
  final int? width;
  final int? height;

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'width': width,
      'height': height,
    };
  }

  WixThumbnail copyWith({
    String? url,
    int? width,
    int? height,
  }) {
    return WixThumbnail(
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }
}

class WixProductOption {
  WixProductOption({
    this.optionType,
    this.name,
    this.choices,
  });

  factory WixProductOption.fromJson(Map<String, dynamic> json) {
    return WixProductOption(
      optionType: CastService.toStringValue(json['optionType']),
      name: CastService.toStringValue(json['name']),
      choices: json['choices'] != null
          ? (json['choices'] as List)
              .map((e) => WixProductChoice.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
  final String? optionType;
  final String? name;
  final List<WixProductChoice>? choices;

  Map<String, dynamic> toJson() {
    return {
      'optionType': optionType,
      'name': name,
      'choices': choices?.map((e) => e.toJson()).toList(),
    };
  }

  WixProductOption copyWith({
    String? optionType,
    String? name,
    List<WixProductChoice>? choices,
  }) {
    return WixProductOption(
      optionType: optionType ?? this.optionType,
      name: name ?? this.name,
      choices: choices ?? this.choices,
    );
  }
}

class WixProductChoice {
  WixProductChoice({
    this.value,
    this.description,
    this.inStock,
    this.visible,
  });

  factory WixProductChoice.fromJson(Map<String, dynamic> json) {
    return WixProductChoice(
      value: CastService.toStringValue(json['value']),
      description: CastService.toStringValue(json['description']),
      inStock: CastService.toBool(json['inStock']),
      visible: CastService.toBool(json['visible']),
    );
  }
  final String? value;
  final String? description;
  final bool? inStock;
  final bool? visible;

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'description': description,
      'inStock': inStock,
      'visible': visible,
    };
  }

  WixProductChoice copyWith({
    String? value,
    String? description,
    bool? inStock,
    bool? visible,
  }) {
    return WixProductChoice(
      value: value ?? this.value,
      description: description ?? this.description,
      inStock: inStock ?? this.inStock,
      visible: visible ?? this.visible,
    );
  }
}

class WixProductPageUrl {
  WixProductPageUrl({
    this.base,
    this.path,
  });

  factory WixProductPageUrl.fromJson(Map<String, dynamic> json) {
    return WixProductPageUrl(
      base: CastService.toStringValue(json['base']),
      path: CastService.toStringValue(json['path']),
    );
  }
  final String? base;
  final String? path;

  Map<String, dynamic> toJson() {
    return {
      'base': base,
      'path': path,
    };
  }

  WixProductPageUrl copyWith({
    String? base,
    String? path,
  }) {
    return WixProductPageUrl(
      base: base ?? this.base,
      path: path ?? this.path,
    );
  }
}

class WixDiscount {
  WixDiscount({
    this.type,
    this.value,
  });

  factory WixDiscount.fromJson(Map<String, dynamic> json) {
    return WixDiscount(
      type: CastService.toStringValue(json['type']),
      value: CastService.toDouble(json['value']),
    );
  }
  final String? type;
  final double? value;

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
    };
  }

  WixDiscount copyWith({
    String? type,
    double? value,
  }) {
    return WixDiscount(
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }
}

class WixProductVariant {
  WixProductVariant({
    this.id,
    this.choices,
    this.variant,
    this.stock,
  });

  factory WixProductVariant.fromJson(Map<String, dynamic> json) {
    return WixProductVariant(
      id: CastService.toStringValue(json['id']),
      choices: json['choices'] != null
          ? Map<String, dynamic>.from(json['choices'] as Map)
          : null,
      variant: json['variant'] != null
          ? WixVariantData.fromJson(json['variant'] as Map<String, dynamic>)
          : null,
      stock: json['stock'] != null
          ? WixVariantStock.fromJson(json['stock'] as Map<String, dynamic>)
          : null,
    );
  }
  final String? id;
  final Map<String, dynamic>? choices;
  final WixVariantData? variant;
  final WixVariantStock? stock;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'choices': choices,
      'variant': variant?.toJson(),
      'stock': stock?.toJson(),
    };
  }

  WixProductVariant copyWith({
    String? id,
    Map<String, dynamic>? choices,
    WixVariantData? variant,
    WixVariantStock? stock,
  }) {
    return WixProductVariant(
      id: id ?? this.id,
      choices: choices ?? this.choices,
      variant: variant ?? this.variant,
      stock: stock ?? this.stock,
    );
  }
}

class WixVariantData {
  WixVariantData({
    this.priceData,
    this.convertedPriceData,
    this.weight,
    this.sku,
    this.visible,
  });

  factory WixVariantData.fromJson(Map<String, dynamic> json) {
    return WixVariantData(
      priceData: json['priceData'] != null
          ? WixPriceData.fromJson(json['priceData'] as Map<String, dynamic>)
          : null,
      convertedPriceData: json['convertedPriceData'] != null
          ? WixPriceData.fromJson(
              json['convertedPriceData'] as Map<String, dynamic>,
            )
          : null,
      weight: CastService.toDouble(json['weight']),
      sku: CastService.toStringValue(json['sku']),
      visible: CastService.toBool(json['visible']),
    );
  }
  final WixPriceData? priceData;
  final WixPriceData? convertedPriceData;
  final double? weight;
  final String? sku;
  final bool? visible;

  Map<String, dynamic> toJson() {
    return {
      'priceData': priceData?.toJson(),
      'convertedPriceData': convertedPriceData?.toJson(),
      'weight': weight,
      'sku': sku,
      'visible': visible,
    };
  }

  WixVariantData copyWith({
    WixPriceData? priceData,
    WixPriceData? convertedPriceData,
    double? weight,
    String? sku,
    bool? visible,
  }) {
    return WixVariantData(
      priceData: priceData ?? this.priceData,
      convertedPriceData: convertedPriceData ?? this.convertedPriceData,
      weight: weight ?? this.weight,
      sku: sku ?? this.sku,
      visible: visible ?? this.visible,
    );
  }
}

class WixVariantStock {
  WixVariantStock({
    this.trackQuantity,
    this.inStock,
  });

  factory WixVariantStock.fromJson(Map<String, dynamic> json) {
    return WixVariantStock(
      trackQuantity: CastService.toBool(json['trackQuantity']),
      inStock: CastService.toBool(json['inStock']),
    );
  }
  final bool? trackQuantity;
  final bool? inStock;

  Map<String, dynamic> toJson() {
    return {
      'trackQuantity': trackQuantity,
      'inStock': inStock,
    };
  }

  WixVariantStock copyWith({
    bool? trackQuantity,
    bool? inStock,
  }) {
    return WixVariantStock(
      trackQuantity: trackQuantity ?? this.trackQuantity,
      inStock: inStock ?? this.inStock,
    );
  }
}

class WixImage {
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
      height: CastService.toInt(json['height']),
      width: CastService.toInt(json['width']),
    );
  }
  final String? id;
  final String? url;
  final int? height;
  final int? width;

  WixImage copyWith({
    String? id,
    String? url,
    int? height,
    int? width,
  }) {
    return WixImage(
      id: id ?? this.id,
      url: url ?? this.url,
      height: height ?? this.height,
      width: width ?? this.width,
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
