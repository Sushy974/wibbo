// ignore_for_file: public_member_api_docs, avoid_equals_and_hash_code_on_mutable_classes

import 'package:wibbo_api/models/hiboutik_product_size_detail.dart';

class HiboutikProduct {
  HiboutikProduct({
    required this.productId,
    required this.productModel,
    required this.productBarcode,
    required this.productBrand,
    required this.productSupplier,
    required this.productPrice,
    required this.productDiscountPrice,
    required this.productSupplyPrice,
    required this.pointsIn,
    required this.pointsOut,
    required this.productCategory,
    required this.productSizeType,
    required this.productPackage,
    required this.productStockManagement,
    required this.productSupplierReference,
    required this.productVat,
    required this.productDisplay,
    required this.productDisplayWww,
    required this.productArch,
    required this.productsDesc,
    required this.productFontColor,
    required this.productBckBtnColor,
    required this.productsRefExt,
    required this.productOrder,
    required this.weight,
    required this.multiple,
    required this.updatedAt,
    required this.productSpecificRules,
    this.productSizeDetails,
  });

  factory HiboutikProduct.fromJson(Map<String, dynamic> json) {
    return HiboutikProduct(
      productId: (json['product_id'] as int?) ?? 0,
      productModel: (json['product_model'] as String?) ?? '',
      productBarcode: (json['product_barcode'] as String?) ?? '',
      productBrand: (json['product_brand'] as int?) ?? 0,
      productSupplier: (json['product_supplier'] as int?) ?? 0,
      productPrice: (json['product_price'] as String?) ?? '0.00',
      productDiscountPrice:
          (json['product_discount_price'] as String?) ?? '0.00',
      productSupplyPrice: (json['product_supply_price'] as String?) ?? '0.00',
      pointsIn: (json['points_in'] as int?) ?? 0,
      pointsOut: (json['points_out'] as int?) ?? 0,
      productCategory: (json['product_category'] as int?) ?? 0,
      productSizeType: (json['product_size_type'] as int?) ?? 0,
      productPackage: (json['product_package'] as int?) ?? 0,
      productStockManagement: (json['product_stock_management'] as int?) ?? 0,
      productSupplierReference:
          (json['product_supplier_reference'] as String?) ?? '',
      productVat: (json['product_vat'] as int?) ?? 0,
      productDisplay: (json['product_display'] as int?) ?? 0,
      productDisplayWww: (json['product_display_www'] as int?) ?? 0,
      productArch: (json['product_arch'] as int?) ?? 0,
      productsDesc: (json['products_desc'] as String?) ?? '',
      productFontColor: (json['product_font_color'] as String?) ?? '#000000',
      productBckBtnColor:
          (json['product_bck_btn_color'] as String?) ?? '#cccccc',
      productsRefExt: (json['products_ref_ext'] as String?) ?? '',
      productOrder: (json['product_order'] as int?) ?? 0,
      weight: (json['weight'] as String?) ?? '0.00',
      multiple: (json['multiple'] as int?) ?? 1,
      updatedAt: (json['updated_at'] as String?) ?? '',
      productSpecificRules:
          (json['product_specific_rules'] as List<dynamic>?) ?? [],
      productSizeDetails: json['product_size_details'] != null
          ? (json['product_size_details'] as List<dynamic>)
              .map((e) =>
                  HiboutikProductSizeDetail.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
  final int productId;
  final String productModel;
  final String productBarcode;
  final int productBrand;
  final int productSupplier;
  final String productPrice;
  final String productDiscountPrice;
  final String productSupplyPrice;
  final int pointsIn;
  final int pointsOut;
  final int productCategory;
  final int productSizeType;
  final int productPackage;
  final int productStockManagement;
  final String productSupplierReference;
  final int productVat;
  final int productDisplay;
  final int productDisplayWww;
  final int productArch;
  final String productsDesc;
  final String productFontColor;
  final String productBckBtnColor;
  final String productsRefExt;
  final int productOrder;
  final String weight;
  final int multiple;
  final String updatedAt;
  final List<dynamic> productSpecificRules;
  final List<HiboutikProductSizeDetail>? productSizeDetails;

  bool get isProductSimple {
    if (productSizeDetails == null) {
      return true;
    }
    if (productSizeDetails!.isEmpty) {
      return true;
    }
    return false;
  }

  bool get isProductVariable => !isProductSimple;

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_model': productModel,
      'product_barcode': productBarcode,
      'product_brand': productBrand,
      'product_supplier': productSupplier,
      'product_price': productPrice,
      'product_discount_price': productDiscountPrice,
      'product_supply_price': productSupplyPrice,
      'points_in': pointsIn,
      'points_out': pointsOut,
      'product_category': productCategory,
      'product_size_type': productSizeType,
      'product_package': productPackage,
      'product_stock_management': productStockManagement,
      'product_supplier_reference': productSupplierReference,
      'product_vat': productVat,
      'product_display': productDisplay,
      'product_display_www': productDisplayWww,
      'product_arch': productArch,
      'products_desc': productsDesc,
      'product_font_color': productFontColor,
      'product_bck_btn_color': productBckBtnColor,
      'products_ref_ext': productsRefExt,
      'product_order': productOrder,
      'weight': weight,
      'multiple': multiple,
      'updated_at': updatedAt,
      'product_specific_rules': productSpecificRules,
      'product_size_details':
          productSizeDetails?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'HiboutikProduct(productId: $productId, productModel: $productModel, productBarcode: $productBarcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HiboutikProduct && other.productId == productId;
  }

  @override
  int get hashCode => productId.hashCode;
}
