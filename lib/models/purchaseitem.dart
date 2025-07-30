class CartItem {
  final int productId;
  final String name;
  final int quantity;
  final int price;
  final String image;
  final String color;

  CartItem({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
    required this.color,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'total': quantity * price,
      'active': true,
    };
  }
}