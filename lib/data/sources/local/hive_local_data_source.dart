import 'package:hive/hive.dart';
import '../../models/product_model.dart';

class HiveLocalDataSource {
  static const String boxName = 'favorites';
  late Box<ProductModel> _box;

  Future<void> init() async {
    _box = await Hive.openBox<ProductModel>(boxName);
  }

  Future<void> toggleFavorite(ProductModel product) async {
    if (_box.containsKey(product.id)) {
      await _box.delete(product.id);
    } else {
      await _box.put(product.id, product);
    }
  }

  List<ProductModel> getFavorites() {
    return _box.values.toList();
  }

  bool isFavorite(ProductModel product) {
    return _box.containsKey(product.id);
  }
}