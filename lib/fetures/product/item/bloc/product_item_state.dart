part of 'product_item_bloc.dart';

abstract class ProductItemState extends Equatable {}

class ProductItemInitial extends ProductItemState {
  @override
  List<Object?> get props => [];
}

class ProductItemLoading extends ProductItemState {
  @override
  List<Object?> get props => [];
}

class ProductItemLoaded extends ProductItemState {
  ProductItemLoaded({required this.productItem});

  final ProductDetails productItem;

  @override
  List<Object?> get props => [productItem];
}

class ProductItemLoadingError extends ProductItemState {
  ProductItemLoadingError({required this.error});

  final Object? error;

  @override
  List<Object?> get props => [error];
}
