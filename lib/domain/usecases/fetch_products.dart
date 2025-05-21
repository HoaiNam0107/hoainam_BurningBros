import '../entities/product.dart';
import '../repositories/product_repository.dart';

class FetchProducts {
  final ProductRepository repository;

  FetchProducts(this.repository);

  Future<List<Product>> call(int skip, int limit) async {
    return await repository.fetchProducts(skip, limit);
  }
}