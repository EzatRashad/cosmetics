import 'package:cosmetics/models/cart_item_model.dart';

class CartModel {
  final List<CartItemModel> items;
  final double total;

  CartModel({required this.items, required this.total});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      items: List<CartItemModel>.from(
        json['items'].map((e) => CartItemModel.fromJson(e)),
      ),
      total: (json['total'] as num).toDouble(),
    );
  }
}
