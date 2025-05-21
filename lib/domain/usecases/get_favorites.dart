import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetFavorites {
  final ProductRepository repository;

  GetFavorites(this.repository);

  List<Product> call() {
    return repository.getFavorites();
  }
}