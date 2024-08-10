import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:test_project/repositories/products/products.dart';

part 'product_item_event.dart';
part 'product_item_state.dart';

class ProductItemBloc extends Bloc<ProductItemEvent, ProductItemState> {
  ProductItemBloc(this.productsRepository) : super(ProductItemInitial()) {
    on<LoadProductItem>((event, emit) async {
      try {
        if (state is! ProductItemLoaded) {
          emit(ProductItemLoading());
        }

        final productItem =
            await productsRepository.getProduct(event.productId);
        emit(ProductItemLoaded(productItem: productItem));
      } catch (error, st) {
        emit(ProductItemLoadingError(error: error));
        GetIt.I<Talker>().handle(error, st);
      } finally {
        event.compliter?.complete();
      }
    });
  }

  final AbstractProductsRepository productsRepository;

  @override
  void onError(Object error, StackTrace stackTrace) {
    GetIt.I<Talker>().handle(error, stackTrace);
    super.onError(error, stackTrace);
  }
}
