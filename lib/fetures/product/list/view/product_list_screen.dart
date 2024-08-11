import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:test_project/repositories/products/products.dart';
import 'package:test_project/shared/widgets/custom_error_widget.dart';

import '../bloc/product_list_bloc.dart';
import '../widgets/widgets.dart';

@RoutePage()
class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

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
          title: const Text('Product list'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          TalkerScreen(talker: GetIt.I<Talker>())));
                },
                icon: const Icon(Icons.document_scanner_outlined))
          ],
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
                return CustomErrorWidget(
                    onUpdate: () => {_productListBloc.add(LoadProductList())});
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
