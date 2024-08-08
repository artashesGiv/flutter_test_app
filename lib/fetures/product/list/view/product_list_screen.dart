import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_project/fetures/product/list/bloc/product_list_bloc.dart';
import 'package:test_project/repositories/products/products.dart';

import '../widgets/widgets.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key, required this.title});

  final String title;

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  final _productListBloc =
      ProductListBloc(GetIt.I<AbstractProductsRepository>());

  @override
  void initState() {
    _productListBloc.add(LoadProductList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final compliter = Completer();
            _productListBloc.add(LoadProductList(compliter: compliter));
            return compliter.future;
          },
          child: BlocBuilder<ProductListBloc, ProductListState>(
            bloc: _productListBloc,
            builder: (context, state) {
              if (state is ProductListLoaded) {
                return ListView.separated(
                    itemCount: state.productList.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final product = state.productList[index];

                      return ProductTile(product: product);
                    });
              }
              if (state is ProductListLoadingError) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Что-то пошло не так',
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      'Попробуйте еще раз',
                      style: theme.textTheme.labelSmall,
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                        onPressed: () =>
                            {_productListBloc.add(LoadProductList())},
                        child: const Text('Попробовать еще раз'))
                  ],
                ));
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
