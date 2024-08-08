import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_project/repositories/products/products.dart';
import 'package:test_project/shared/widgets/custom_error_widget.dart';

import '../bloc/product_item_bloc.dart';
import '../widgets/widgets.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class ProductScreenArgs {
  ProductScreenArgs({required this.title, required this.id});

  final String title;
  final int id;
}

class _ProductScreenState extends State<ProductScreen> {
  String? productName;
  int? productId;

  final _productItemBloc =
      ProductItemBloc(GetIt.I<AbstractProductsRepository>());

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    assert(args is ProductScreenArgs, 'Невалидные аргументы');

    final myArgs = args as ProductScreenArgs;
    productName = myArgs.title;
    productId = myArgs.id;

    if (productId != null) {
      _productItemBloc.add(LoadProductItem(productId: productId!));
    }

    setState(() {});

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(productName ?? '...'),
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final compliter = Completer();
          _productItemBloc.add(
              LoadProductItem(compliter: compliter, productId: productId!));
          return compliter.future;
        },
        child: BlocBuilder<ProductItemBloc, ProductItemState>(
          bloc: _productItemBloc,
          builder: (context, state) {
            if (state is ProductItemLoaded) {
              return ListView(children: [
                ProductImage(imageUrl: state.productItem.image),
                const SizedBox(height: 10),
                ProductPrice(
                    smallerPrice: state.productItem.price,
                    largerPrice: state.productItem.price),
                const SizedBox(height: 10),
                ProductInfo(
                    title: state.productItem.title,
                    description: state.productItem.description),
                const SizedBox(height: 10),
                ProductRating(productRating: state.productItem.rating),
              ]);
            }

            if (state is ProductItemLoadingError) {
              return CustomErrorWidget(
                  onUpdate: () => {
                        _productItemBloc
                            .add(LoadProductItem(productId: productId!))
                      });
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
