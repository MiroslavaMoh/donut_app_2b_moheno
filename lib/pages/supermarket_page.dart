// supermarket_page.dart
import 'package:flutter/material.dart';
import 'package:donut_app_2b_moheno/common/color_extension.dart';
import 'package:donut_app_2b_moheno/common_widget/navigate_drawer.dart';
import 'package:donut_app_2b_moheno/utils/cart_page.dart';

// models
import 'package:donut_app_2b_moheno/models/product.dart';
import 'package:donut_app_2b_moheno/models/category.dart';

// services
import 'package:donut_app_2b_moheno/services/product_service.dart';
import 'package:donut_app_2b_moheno/services/cart_service.dart';

class SuperMarketPage extends StatefulWidget {
  const SuperMarketPage({super.key});

  @override
  State<SuperMarketPage> createState() => _SuperMarketPageState();
}

class _SuperMarketPageState extends State<SuperMarketPage> {
  List<Product> products = [];
  bool isLoading = true;
  int? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts({int? categoryId}) async {
    setState(() {
      isLoading = true;
    });

    try {
      final fetchedProducts = categoryId == null
          ? await ProductService.getAllProducts()
          : await ProductService.getProductsByCategory(categoryId);
      setState(() {
        products = fetchedProducts;
      });
    } catch (e) {
      print("Error al cargar productos: $e");
      setState(() {
        products = [];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget buildDropdown() {
    return DropdownButton<int>(
      hint: const Text("Selecciona categoría"),
      value: selectedCategoryId,
      onChanged: (value) {
        setState(() {
          selectedCategoryId = value;
        });
        loadProducts(categoryId: value);
      },
      items: categories.map((cat) {
        return DropdownMenuItem<int>(
          value: cat.id,
          child: Text(cat.name),
        );
      }).toList(),
    );
  }

  Widget buildProductTile(Product product) {
    Color backgroundColor;
    try {
      backgroundColor = HexColor.formHex(product.color).withAlpha(30);
    } catch (_) {
      backgroundColor = Colors.grey.shade100;
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 60),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            "\$${product.price.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "Stock: ${product.stock}",
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                CartService.addProduct(product);
              });
              /*ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${product.name} agregado al carrito")),
              );*/
            },
            child: Text(
              "Add",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double total = CartService.total;
    int count = CartService.totalItems;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.grey[800]),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        body: Column(
          children: [
            const Text("¡Bienvenido a DonutApp!", style: TextStyle(fontSize: 28)),
            Padding(
              padding: const EdgeInsets.all(12),
              child: buildDropdown(),
            ),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : products.isEmpty
                      ? const Center(child: Text("No hay productos"))
                      : GridView.builder(
                          padding: const EdgeInsets.all(8),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return buildProductTile(products[index]);
                          },
                        ),
            ),
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
                          builder: (context) => CartPage(cartItems: CartService.items),
                        ),
                      );
                      setState(() {}); // Refresh total/cart count
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 218, 113, 148),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text('View Cart', style: TextStyle(color: Colors.white)),
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
