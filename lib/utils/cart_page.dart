// cart_page.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:donut_app_2b_moheno/services/cart_service.dart';

import 'package:donut_app_2b_moheno/pages/thankyou_page.dart';
import 'package:donut_app_2b_moheno/pages/home_page.dart';


class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Future<void> _sendPurchase(List<Map<String, dynamic>> items) async {
    if (widget.cartItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("El carrito está vacío")));
      return;
    }

    final purchase = {
      "clientId": "CLI002",
      "date": DateTime.now().toIso8601String(),
      "paymentMethod": "T",
      "comment": "",
      "state": "true",
      "items": widget.cartItems.map((item) => {
            "productId": item['productId'],
            "quantity": item['quantity'],
            "total": item['total'],
            "active": true,
          }).toList(),
    };

    final url = Uri.parse("http://localhost:8080/market-app/api/save");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(purchase),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = json.decode(response.body);
        final purchaseId = responseData['purchaseId'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Compra realizada. ID: $purchaseId")),
        );
        setState(() {
          CartService.clear();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al enviar la compra")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error de red: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double total = CartService.total;

    return Scaffold(
      appBar: AppBar(title: const Text("Carrito de Compras")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                var item = widget.cartItems[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text(
                    "Cantidad: ${item['quantity']} | Subtotal: \$${item['total']}",
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        CartService.removeProduct(item['productId']);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Total: \$${total.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 24)),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.shopping_cart_checkout),
                label: const Text("Finalizar compra"),
                onPressed: () async {
                  try {
                    await _sendPurchase(CartService.items); // Enviar datos al backend
                    CartService.clear(); // Limpiar carrito
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const ThankYouPage()),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error al realizar compra: $e")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 218, 113, 148),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ),

        ],
      ),
    );
  }
}

