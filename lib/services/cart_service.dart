// cart_service.dart
import 'package:donut_app_2b_moheno/models/product.dart';
import 'package:donut_app_2b_moheno/models/purchaseitem.dart';

class CartService {
  static final List<Map<String, dynamic>> _items = [];

  static List<Map<String, dynamic>> get items => _items;

  static void addProduct(Product product) {
    final index = _items.indexWhere((item) => item['productId'] == product.id);
    if (index >= 0) {
      _items[index]['quantity'] += 1;
      _items[index]['total'] = _items[index]['quantity'] * product.price;
    } else {
      _items.add({
        'productId': product.id,
        'quantity': 1,
        'total': product.price,
        'active': true,
        'name': product.name,
        'price': product.price,
        'image': product.image,
      });
    }
  }

  static void removeProduct(int productId) {
    _items.removeWhere((item) => item['productId'] == productId);
  }

  static void clear() => _items.clear();

  static double get total => _items.fold(0, (sum, item) => sum + item['total']);

  static int get totalItems =>
      _items.fold(0, (sum, item) => sum + (item['quantity'] as int));
}


