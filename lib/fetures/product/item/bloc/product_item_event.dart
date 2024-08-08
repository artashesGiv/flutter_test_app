part of 'product_item_bloc.dart';

abstract class ProductItemEvent extends Equatable {}

class LoadProductItem extends ProductItemEvent {
  LoadProductItem({required this.productId, this.compliter});

  final Completer? compliter;
  final int productId;

  @override
  List<Object?> get props => [compliter];
}
