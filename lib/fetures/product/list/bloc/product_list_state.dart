part of 'product_list_bloc.dart';

class ProductListState {}

class ProductListInitial extends ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListLoaded extends ProductListState {
  ProductListLoaded({required this.productList});

  final List<ProductModel> productList;
}

class ProductListLoadingError extends ProductListState {
  ProductListLoadingError({required this.error});

  final Object? error;
}
