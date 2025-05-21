import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../bloc/product/product_bloc.dart';
import '../../bloc/product/product_event.dart';
import '../../bloc/product/product_state.dart';

class ProductListView extends StatelessWidget {
  final ScrollController scrollController;

  const ProductListView({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductError) {
          return Center(child: Text(state.message));
        }

        final products = state is ProductLoaded ? state.products : [];
        final favorites = state is ProductLoaded ? state.favorites : [];
        final hasMore = state is ProductLoaded ? state.hasMore : false;

        if (state is ProductLoading && products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (products.isEmpty && !hasMore) {
          return const Center(child: Text('No products found'));
        }

        return ListView.builder(
          controller: scrollController,
          itemCount: products.length + (hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= products.length) {
              if (hasMore) {
                context.read<ProductBloc>().add(FetchProductsEvent());
              }
              return const Center(child: CircularProgressIndicator());
            }
            final product = products[index];
            final isFavorite = favorites.any((p) => p.id == product.id);
            return ListTile(
              leading: CachedNetworkImage(
                imageUrl: product.thumbnail,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              title: Text(product.title),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  context.read<ProductBloc>().add(ToggleFavoriteEvent(product));
                },
              ),
            );
          },
        );
      },
    );
  }
}