class Product {
  final int id;
  final String name;
  final String description;
  final String image;
  final String color;
  final double price;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this. image,
    required this. color,
    required this.price,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['productId'] ?? json['idProducto'] ?? 0,
      name: json['name'] ?? json['nombre'] ?? '',
      description: json['description'] ?? json['description'] ?? '',
      image: json['image'] ?? json['image'] ?? '',
      color: json['color'] ?? json['color'] ?? '',
      price: (json['price'] ?? json['precioVenta'] ?? 0).toDouble(),
      stock: json['stock'] ?? json['cantidadStock'] ?? 0,
    );
  }
}