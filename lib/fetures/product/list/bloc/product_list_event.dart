part of 'product_list_bloc.dart';

abstract class ProductListEvent {}

class LoadProductList extends ProductListEvent {
  LoadProductList({this.compliter});

  final Completer? compliter;
}
