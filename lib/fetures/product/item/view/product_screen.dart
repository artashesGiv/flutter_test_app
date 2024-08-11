import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_project/repositories/products/products.dart';
import 'package:test_project/shared/widgets/custom_error_widget.dart';

import '../bloc/product_item_bloc.dart';
import '../widgets/widgets.dart';

@RoutePage()
class ProductScreen extends StatefulWidget {
  const ProductScreen(
      {super.key, required this.productName, required this.productId});

  final String productName;
  final int productId;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _productItemBloc =
      ProductItemBloc(GetIt.I<AbstractProductsRepository>());

  @override
  void initState() {
    _productItemBloc.add(LoadProductItem(productId: widget.productId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget.productName),
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final compliter = Completer();
          _productItemBloc.add(LoadProductItem(
              compliter: compliter, productId: widget.productId));
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
                            .add(LoadProductItem(productId: widget.productId))
                      });
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
