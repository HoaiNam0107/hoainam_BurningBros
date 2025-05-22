import '../../../domain/entities/product.dart';
import '../../../domain/usecases/fetch_products.dart';
import '../../../domain/usecases/search_products.dart';
import '../../../domain/usecases/toggle_favorite.dart';
import '../../../domain/usecases/get_favorites.dart';

Future<List<Product>> fetchProductsIsolate(Map<String, dynamic> params) async {
  final fetchProducts = params['fetchProducts'] as FetchProducts;
  final skip = params['skip'] as int;
  final limit = params['limit'] as int;
  return await fetchProducts(skip, limit);
}

Future<List<Product>> searchProductsIsolate(Map<String, dynamic> params) async {
  final searchProducts = params['searchProducts'] as SearchProducts;
  final query = params['query'] as String;
  return await searchProducts(query);
}

Future<List<Product>> toggleFavoriteIsolate(Map<String, dynamic> params) async {
  final toggleFavorite = params['toggleFavorite'] as ToggleFavorite;
  final getFavorites = params['getFavorites'] as GetFavorites;
  final product = params['product'] as Product;

  await toggleFavorite(product);
  return await getFavorites();
}

Future<List<Product>> getFavoritesIsolate(GetFavorites getFavorites) async {
  return await getFavorites();
}
