/*import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:donut_app_2b_moheno/models/category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryService {
  static const String baseUrl = "http://localhost:8080/market-app/api";

  static Future<Map<String, String>> _getHeadersWithToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }

  static Future<List<Category>> getAllCategories() async {
    final headers = await _getHeadersWithToken();
    final response = await http.get(Uri.parse('$baseUrl/categories'), headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Category.fromJson(item)).toList();
    } else {
      throw Exception("Error al cargar categorías: ${response.statusCode}");
    }
  }
}*/
