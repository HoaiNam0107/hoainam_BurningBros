import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts(int skip, int limit);
  Future<List<Product>> searchProducts(String query);
  Future<void> toggleFavorite(Product product);
  List<Product> getFavorites();
  bool isFavorite(Product product);
}