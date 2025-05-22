import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/isolate/product_isolate.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/fetch_products.dart';
import '../../../domain/usecases/search_products.dart';
import '../../../domain/usecases/toggle_favorite.dart';
import '../../../domain/usecases/get_favorites.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({
    required this.fetchProducts,
    required this.searchProducts,
    required this.toggleFavorite,
    required this.getFavorites,
  }) : super(ProductInitial()) {
    on<FetchProductsEvent>(_onFetchProducts);
    on<SearchProductsEvent>(_onSearchProducts);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
  }

  final FetchProducts fetchProducts;
  final SearchProducts searchProducts;
  final ToggleFavorite toggleFavorite;
  final GetFavorites getFavorites;
  final List<Product> _products = [];
  bool _hasMore = true;
  String _searchQuery = '';
  Timer? _debounce;
  int _skip = 0;
  static const int _limit = 20;

  Future<void> _onFetchProducts(
    FetchProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    if (!_hasMore || _searchQuery.isNotEmpty) return;

    try {
      if (_products.isEmpty) {
        emit(ProductLoading());
      }

      final newProducts = await fetchProductsIsolate({
        'fetchProducts': fetchProducts,
        'skip': _skip,
        'limit': _limit,
      });

      final favorites = await getFavoritesIsolate(getFavorites);

      if (newProducts.isEmpty) {
        _hasMore = false;
      } else {
        _products.addAll(newProducts);
        _skip += _limit;
      }
      emit(
        ProductLoaded(
          products: List.from(_products),
          favorites: favorites,
          hasMore: _hasMore,
        ),
      );
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onSearchProducts(
    SearchProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    final completer = Completer<void>();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      completer.complete();
    });

    await completer.future;

    try {
      _searchQuery = event.query;
      emit(ProductLoading());

      if (event.query.isEmpty) {
        _hasMore = true;
        _products.clear();
        _skip = 0;
        add(FetchProductsEvent());
      } else {
        final products = await searchProductsIsolate({
          'searchProducts': searchProducts,
          'query': event.query,
        });

        final favorites = await getFavoritesIsolate(getFavorites);

        emit(
          ProductLoaded(
            products: products,
            favorites: favorites,
            hasMore: false,
          ),
        );
      }
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavoriteEvent event,
    Emitter<ProductState> emit,
  ) async {
    final currentState = state;
    if (currentState is ProductLoaded) {
      final favorites = await toggleFavoriteIsolate({
        'toggleFavorite': toggleFavorite,
        'getFavorites': getFavorites,
        'product': event.product,
      });

      emit(
        ProductLoaded(
          products: currentState.products,
          favorites: favorites,
          hasMore: currentState.hasMore,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
