import '../../../domain/entities/product.dart';

abstract class ProductEvent {}

class FetchProductsEvent extends ProductEvent {
  final int pageKey;
  FetchProductsEvent({this.pageKey = 0});
}

class SearchProductsEvent extends ProductEvent {
  final String query;
  SearchProductsEvent(this.query);
}

class ToggleFavoriteEvent extends ProductEvent {
  final Product product;
  ToggleFavoriteEvent(this.product);
}