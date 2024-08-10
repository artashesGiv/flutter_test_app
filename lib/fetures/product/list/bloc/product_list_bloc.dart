import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:test_project/repositories/products/products.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc(this.productsRepository) : super(ProductListInitial()) {
    on<LoadProductList>((event, emit) async {
      try {
        if (state is! ProductListLoaded) {
          emit(ProductListLoading());
        }

        final productList = await productsRepository.getProducts();
        emit(ProductListLoaded(productList: productList));
      } catch (error, st) {
        emit(ProductListLoadingError(error: error));
        GetIt.I<Talker>().handle(error, st);
      } finally {
        event.compliter?.complete();
      }
    });
  }

  final AbstractProductsRepository productsRepository;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
