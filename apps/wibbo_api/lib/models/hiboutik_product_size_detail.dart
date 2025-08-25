// ignore_for_file: public_member_api_docs

class HiboutikProductSizeDetail {
  HiboutikProductSizeDetail({
    required this.sizeId,
    required this.sizeName,
    required this.barcode,
  });

  factory HiboutikProductSizeDetail.fromJson(Map<String, dynamic> json) {
    return HiboutikProductSizeDetail(
      sizeId: (json['size_id'] as int?) ?? 0,
      sizeName: (json['size_name'] as String?) ?? '',
      barcode: (json['barcode'] as String?) ?? '',
    );
  }

  final int sizeId;
  final String sizeName;
  final String barcode;

  Map<String, dynamic> toJson() {
    return {
      'size_id': sizeId,
      'size_name': sizeName,
      'barcode': barcode,
    };
  }

  @override
  String toString() {
    return 'ProductSizeDetail(sizeId: $sizeId, sizeName: $sizeName, barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HiboutikProductSizeDetail && other.sizeId == sizeId;
  }

  @override
  int get hashCode => sizeId.hashCode;
}
