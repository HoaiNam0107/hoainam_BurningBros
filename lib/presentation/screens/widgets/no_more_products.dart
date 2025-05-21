import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product/product_bloc.dart';
import '../../bloc/product/product_state.dart';


class NoMoreProducts extends StatelessWidget {
  const NoMoreProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProductBloc, ProductState, bool>(
      selector: (state) =>
      state is ProductLoaded && !state.hasMore && state.products.isNotEmpty,
      builder: (context, showMessage) {
        return showMessage
            ? const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('No more products to load'),
        )
            : const SizedBox();
      },
    );
  }
}