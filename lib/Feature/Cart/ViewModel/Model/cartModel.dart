class CartModel {
  final int id;
  final String userId;
  final int itemsCount;
  final List<CartItem> items;
  final double totalAmount;

  CartModel({
    required this.id,
    required this.userId,
    required this.itemsCount,
    required this.items,
    required this.totalAmount,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: (json['id'] as num).toInt(),
      userId: json['userId'] as String,
      itemsCount: (json['itemsCount'] as num).toInt(),
      items: (json['items'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
    );
  }
  factory CartModel.empty() {
    return CartModel(
      id: 0,
      userId: '',
      itemsCount: 0,
      items: [],
      totalAmount: 0,
    );
  }
}

class CartItem {
  final int id;
  final int productId;
  final String productName;
  final String productImage;
  final double quantity;
  final double unitPrice;
  final double? discountedPrice;
  final double price;
  final double subtotal;
  final String unitName;
  final String unitSymbol;
  final bool isWeighedProduct;
  final int availableStock;
  final double minOrderQty;
  final double maxOrderQty;

  CartItem({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.quantity,
    required this.unitPrice,
    this.discountedPrice,
    required this.price,
    required this.subtotal,
    required this.unitName,
    required this.unitSymbol,
    required this.isWeighedProduct,
    required this.availableStock,
    required this.minOrderQty,
    required this.maxOrderQty,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: (json['id'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      productName: json['productName'] as String,
      productImage: json['productImage'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      discountedPrice: json['discountedPrice'] != null
          ? (json['discountedPrice'] as num).toDouble()
          : null,
      price: (json['price'] as num).toDouble(),
      subtotal: (json['subtotal'] as num).toDouble(),
      unitName: json['unitName'] as String,
      unitSymbol: json['unitSymbol'] as String,
      isWeighedProduct: json['isWeighedProduct'] as bool,
      availableStock: (json['availableStock'] as num).toInt(),
      minOrderQty: (json['minOrderQty'] as num).toDouble(),
      maxOrderQty: (json['maxOrderQty'] as num).toDouble(),
    );
  }

  // السعر الفعلي للعنصر
  double get finalPrice => discountedPrice ?? price;

}