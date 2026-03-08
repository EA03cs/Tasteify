class FavProduct {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final double unitPrice;
  final double? discountedPrice;
  final bool hasDiscount;
  final bool isWeighedProduct;
  final String unitName;
  final String unitSymbol;
  final double minOrderQty;
  final double maxOrderQty;
  final int quantityInStock;
  final bool isAvailable;

  FavProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.unitPrice,
    this.discountedPrice,
    required this.hasDiscount,
    required this.isWeighedProduct,
    required this.unitName,
    required this.unitSymbol,
    required this.minOrderQty,
    required this.maxOrderQty,
    required this.quantityInStock,
    required this.isAvailable,
  });

  factory FavProduct.fromJson(Map<String, dynamic> json) {
    return FavProduct(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      unitPrice: (json['unitPrice'] as num).toDouble(),
      discountedPrice: json['discountedPrice'] != null
          ? (json['discountedPrice'] as num).toDouble()
          : null,
      hasDiscount: json['hasDiscount'] as bool,
      isWeighedProduct: json['isWeighedProduct'] as bool,
      unitName: json['unitName'] as String,
      unitSymbol: json['unitSymbol'] as String,
      minOrderQty: (json['minOrderQty'] as num).toDouble(),
      maxOrderQty: (json['maxOrderQty'] as num).toDouble(),
      quantityInStock: (json['quantityInStock'] as num).toInt(),
      isAvailable: json['isAvailable'] as bool,
    );
  }

  double get finalPrice => hasDiscount && discountedPrice != null
      ? discountedPrice!
      : unitPrice;

  String? get discountPercentage => hasDiscount && discountedPrice != null
      ? '${((unitPrice - discountedPrice!) / unitPrice * 100).round()}% off'
      : null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'unitPrice': unitPrice,
      'discountedPrice': discountedPrice,
      'hasDiscount': hasDiscount,
      'isWeighedProduct': isWeighedProduct,
      'unitName': unitName,
      'unitSymbol': unitSymbol,
      'minOrderQty': minOrderQty,
      'maxOrderQty': maxOrderQty,
      'quantityInStock': quantityInStock,
      'isAvailable': isAvailable,
    };
  }

  @override
  String toString() =>
      'FavProduct{id: $id, name: $name, unitPrice: $unitPrice}';
}