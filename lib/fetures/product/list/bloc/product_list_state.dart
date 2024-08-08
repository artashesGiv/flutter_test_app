part of 'product_list_bloc.dart';

abstract class ProductListState extends Equatable {}

class ProductListInitial extends ProductListState {
  @override
  List<Object?> get props => [];
}

class ProductListLoading extends ProductListState {
  @override
  List<Object?> get props => [];
}

class ProductListLoaded extends ProductListState {
  ProductListLoaded({required this.productList});

  final List<Product> productList;

  @override
  List<Object?> get props => [productList];
}

class ProductListLoadingError extends ProductListState {
  ProductListLoadingError({required this.error});

  final Object? error;

  @override
  List<Object?> get props => [error];
}
