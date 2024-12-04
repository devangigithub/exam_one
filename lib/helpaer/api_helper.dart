import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpepar_api/modal/modal_class.dart';

class ApiHelper {
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> productJson = jsonDecode(response.body);
      return productJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}


