class CartItemModel {
  final int productId;
  final String productName;
  final int quantity;
  final double price;

  CartItemModel({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      productName: json['productName'],
      quantity: json['quantity'],
      price: (json['price'] as num).toDouble(),
    );
  }
}
