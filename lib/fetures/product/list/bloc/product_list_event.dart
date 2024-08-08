part of 'product_list_bloc.dart';

abstract class ProductListEvent extends Equatable {}

class LoadProductList extends ProductListEvent {
  LoadProductList({this.compliter});

  final Completer? compliter;

  @override
  List<Object?> get props => [compliter];
}
