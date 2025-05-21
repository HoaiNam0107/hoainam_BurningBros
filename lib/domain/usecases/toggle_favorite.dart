import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ToggleFavorite {
  final ProductRepository repository;

  ToggleFavorite(this.repository);

  Future<void> call(Product product) async {
    await repository.toggleFavorite(product);
  }
}