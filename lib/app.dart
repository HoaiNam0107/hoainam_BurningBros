import 'package:burning_test/presentation/bloc/product/product_bloc.dart';
import 'package:burning_test/presentation/screens/login/login_screen.dart';
import 'package:burning_test/presentation/screens/test_version/cupertion_sheet_router.dart';
import 'package:burning_test/presentation/screens/test_version/example.dart';
import 'package:burning_test/presentation/screens/product_list_screen.dart';
import 'package:burning_test/presentation/screens/test_version/test_widget.dart';
import 'package:burning_test/presentation/screens/test_version/home.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/product_repository_impl.dart';
import 'data/sources/local/hive_local_data_source.dart';
import 'data/sources/remote/api_data_source.dart';
import 'domain/usecases/fetch_products.dart';
import 'domain/usecases/get_favorites.dart';
import 'domain/usecases/search_products.dart';
import 'domain/usecases/toggle_favorite.dart';

class MyApp extends StatelessWidget {
  final HiveLocalDataSource localDataSource;

  MyApp({required this.localDataSource});

  @override
  Widget build(BuildContext context) {
    final productRepository = ProductRepositoryImpl(
      apiDataSource: ApiDataSource(),
      localDataSource: localDataSource,
      connectivity: Connectivity(),
    );
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => FetchProducts(productRepository)),
        RepositoryProvider(create: (_) => SearchProducts(productRepository)),
        RepositoryProvider(create: (_) => ToggleFavorite(productRepository)),
        RepositoryProvider(create: (_) => GetFavorites(productRepository)),
      ],
      child: BlocProvider(
        create: (context) => ProductBloc(
          fetchProducts: context.read<FetchProducts>(),
          searchProducts: context.read<SearchProducts>(),
          toggleFavorite: context.read<ToggleFavorite>(),
          getFavorites: context.read<GetFavorites>(),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Product List',
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginScreen(),
            '/productList': (context) => const ProductListScreen(),
          },
        ),
      ),
    );
  }
}
