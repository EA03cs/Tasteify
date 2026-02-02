class CategoryWithProducts {
  final int id;
  final String name;
  final String imageUrl;
  final List<Product> products;

  CategoryWithProducts({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.products,
  });

  factory CategoryWithProducts.fromJson(Map<String, dynamic> json) {
    return CategoryWithProducts(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      products: (json['products'] as List?)
          ?.map((e) => Product.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final bool isWeighedProduct;
  final double unitPrice;
  final double? discountedPrice;
  final int minOrderQty;
  final int maxOrderQty;
  final String unitName;
  final String unitSymbol;
  final int quantityInStock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.isWeighedProduct,
    required this.unitPrice,
    this.discountedPrice,
    required this.minOrderQty,
    required this.maxOrderQty,
    required this.unitName,
    required this.unitSymbol,
    required this.quantityInStock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: (json['id'] ?? 0) is int ? json['id'] : (json['id'] as double).toInt(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      isWeighedProduct: json['isWeighedProduct'] ?? false,
      unitPrice: _toDouble(json['unitPrice']),
      discountedPrice: json['discountedPrice'] != null
          ? _toDouble(json['discountedPrice'])
          : null,
      minOrderQty: _toInt(json['minOrderQty'], defaultValue: 1),
      maxOrderQty: _toInt(json['maxOrderQty'], defaultValue: 10),
      unitName: json['unitName'] ?? '',
      unitSymbol: json['unitSymbol'] ?? '',
      quantityInStock: _toInt(json['quantityInStock'], defaultValue: 0),
    );
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  static int _toInt(dynamic value, {int defaultValue = 0}) {
    if (value == null) return defaultValue;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? defaultValue;
    return defaultValue;
  }

  String? get discountPercentage {
    if (discountedPrice == null || discountedPrice == 0) return null;
    final discount = ((unitPrice - discountedPrice!) / unitPrice * 100).round();
    return '$discount% off';
  }

  double get finalPrice => discountedPrice ?? unitPrice;
}