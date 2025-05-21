import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/repositories/product_repository.dart';
import '../models/product_model.dart';
import '../sources/local/hive_local_data_source.dart';
import '../sources/remote/api_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ApiDataSource apiDataSource;
  final HiveLocalDataSource localDataSource;
  final Connectivity connectivity;

  ProductRepositoryImpl({
    required this.apiDataSource,
    required this.localDataSource,
    required this.connectivity,
  });

  @override
  Future<List<Product>> fetchProducts(int skip, int limit) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.none) {
      throw Exception('No internet connection');
    }
    final products = await apiDataSource.fetchProducts(skip, limit);
    return products;
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.none) {
      throw Exception('No internet connection');
    }
    final products = await apiDataSource.searchProducts(query);
    return products;
  }

  @override
  Future<void> toggleFavorite(Product product) async {
    await localDataSource.toggleFavorite(ProductModel.fromEntity(product));
  }

  @override
  List<Product> getFavorites() {
    return localDataSource.getFavorites();
  }

  @override
  bool isFavorite(Product product) {
    return localDataSource.isFavorite(ProductModel.fromEntity(product));
  }
}