import 'package:e_commerce_product_listing_app/src/features/home/models/product_models.dart';
import 'package:equatable/equatable.dart';

abstract class ProductBlocState extends Equatable{
  const ProductBlocState();
}

class ProductBlocInit extends ProductBlocState{

  @override
  List<Object?> get props => [];
}

class ProductBlocLoading extends ProductBlocState{

  @override
  List<Object?> get props =>  [];
}

class ProductBlocDataLoaded extends ProductBlocState{

  final List<Products>productList;
  const ProductBlocDataLoaded({required this.productList});

  @override
  List<Object?> get props => [productList];
}

class ProductBlocError extends ProductBlocState {
  final String errorMessage;
  const ProductBlocError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
