import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/product/product_bloc.dart';
import '../../bloc/product/product_event.dart';

class SearchBarTest extends StatefulWidget {
  const SearchBarTest({super.key});

  @override
  State<SearchBarTest> createState() => _SearchBarTestState();
}

class _SearchBarTestState extends State<SearchBarTest> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search products...',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          context.read<ProductBloc>().add(SearchProductsEvent(value));
        },
      ),
    );
  }
}