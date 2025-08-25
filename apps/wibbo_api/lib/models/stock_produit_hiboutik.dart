// ignore_for_file: public_member_api_docs, avoid_equals_and_hash_code_on_mutable_classes

class StockProduitHiboutik {
  StockProduitHiboutik({
    required this.productId,
    required this.productSize,
    required this.warehouseId,
    required this.stockAvailable,
    required this.inventoryAlert,
    required this.productBarcode,
    required this.productSupplierReference,
  });

  factory StockProduitHiboutik.fromJson(Map<String, dynamic> json) {
    return StockProduitHiboutik(
      productId: (json['product_id'] as int?) ?? 0,
      productSize: (json['product_size'] as int?) ?? 0,
      warehouseId: (json['warehouse_id'] as int?) ?? 0,
      stockAvailable: (json['stock_available'] as int?) ?? 0,
      inventoryAlert: (json['inventory_alert'] as int?) ?? 0,
      productBarcode: (json['product_barcode'] as String?) ?? '',
      productSupplierReference:
          (json['product_supplier_reference'] as String?) ?? '',
    );
  }

  final int productId;
  final int productSize;
  final int warehouseId;
  final int stockAvailable;
  final int inventoryAlert;
  final String productBarcode;
  final String productSupplierReference;

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_size': productSize,
      'warehouse_id': warehouseId,
      'stock_available': stockAvailable,
      'inventory_alert': inventoryAlert,
      'product_barcode': productBarcode,
      'product_supplier_reference': productSupplierReference,
    };
  }

  @override
  String toString() {
    return 'StockProduitHiboutik(productId: $productId, productSize: $productSize, stockAvailable: $stockAvailable)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StockProduitHiboutik &&
        other.productId == productId &&
        other.productSize == productSize &&
        other.warehouseId == warehouseId;
  }

  @override
  int get hashCode => Object.hash(productId, productSize, warehouseId);
}
