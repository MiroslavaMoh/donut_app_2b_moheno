import 'package:donut_app_2b_moheno/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_2b_moheno/models/product.dart';
import 'package:donut_app_2b_moheno/utils/cart_page.dart';

// services
import 'package:donut_app_2b_moheno/services/cart_service.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    // Variables locales que se recalculan en cada build
    double total = CartService.total;
    int count = CartService.totalItems;

    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  widget.product.image,
                  height: 200,
                  fit: BoxFit.fitHeight,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.broken_image, size: 80),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(widget.product.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Precio: \$${widget.product.price}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("Stock: ${widget.product.stock}",
                style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 16),
            const Text("Descripción:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            Text(widget.product.description,
                style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 24),
            // BOTÓN ADD
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                setState(() {
                  CartService.addProduct(widget.product);
                });
              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColor.primary,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text("Add to cart", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),

            const Spacer(), // Empuja el widget inferior al fondo

            // WIDGET DE ABAJO
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$count Items | \$${total.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const Text('Delivery Charges Included',
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CartPage(cartItems: CartService.items),
                        ),
                      );
                      setState(() {}); // Refrescar después de volver del carrito
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          TColor.primary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    child: const Text('View Cart',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
