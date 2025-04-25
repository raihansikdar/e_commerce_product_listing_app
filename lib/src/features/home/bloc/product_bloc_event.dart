import 'package:equatable/equatable.dart';

abstract class ProductBlocEvent extends Equatable{

const ProductBlocEvent();

}

class FetchAllProductEvent extends ProductBlocEvent {
  final int skip;
  final int limit;

  const FetchAllProductEvent({this.skip = 0, this.limit = 20});

  @override
  List<Object?> get props => [skip, limit];
}

class SearchProductEvent extends ProductBlocEvent{
  final String query;
  const SearchProductEvent(this.query);
  @override
  // TODO: implement props
  List<Object?> get props => [query];

}

class SortingOrderProductEvent extends ProductBlocEvent{
  final String sortBy;
  final String orderQuery;
  const SortingOrderProductEvent(this.sortBy,this.orderQuery);
  @override
  // TODO: implement props
  List<Object?> get props => [sortBy,orderQuery];

}

class LoadMoreProductsEvent extends ProductBlocEvent {
  final int skip;
  final int limit;
  const LoadMoreProductsEvent({this.skip = 0, this.limit = 20});

  @override
  List<Object?> get props => [skip, limit];
}
