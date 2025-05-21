import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/product_model.dart';

class ApiDataSource {
  static const String baseUrl = 'https://dummyjson.com';

  Future<List<ProductModel>> fetchProducts(int skip, int limit) async {
    final response = await http.get(Uri.parse('$baseUrl/products?limit=$limit&skip=$skip'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['products'] as List).map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/products/search?q=$query'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['products'] as List).map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search products: ${response.statusCode}');
    }
  }
}