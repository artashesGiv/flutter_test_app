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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: BlocBuilder<ProductListBloc, ProductListState>(
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
              return Center(child: Text(state.error?.toString() ?? 'ERROR'));
            }

            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
