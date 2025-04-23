import 'package:equatable/equatable.dart';

abstract class ProductBlocEvent extends Equatable{

const ProductBlocEvent();

}

class FetchAllProductEvent extends ProductBlocEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}