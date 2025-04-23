import 'package:e_commerce_product_listing_app/src/features/home/bloc/product_bloc_event.dart';
import 'package:e_commerce_product_listing_app/src/features/home/bloc/product_bloc_state.dart';
import 'package:e_commerce_product_listing_app/src/features/home/models/product_models.dart';
import 'package:e_commerce_product_listing_app/src/features/home/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductBlocEvent,ProductBlocState>{
  ProductRepository productRepository = ProductRepository();
  List<Products>productList = [];

  ProductBloc(this.productRepository):super(ProductBlocInit()){
    on<FetchAllProductEvent>((event, emit) async {
      emit(ProductBlocLoading());
      try {
        productList = await productRepository.fetchProductList();
        emit(ProductBlocDataLoaded(productList: productList));
      } catch (e) {

        emit(ProductBlocError(errorMessage: e.toString()));
        throw Exception(e.toString());
      }
    });
    on<SearchProductEvent>((event, emit) async {
      //emit(ProductBlocLoading());
      try {
        final searchResults = await productRepository.fetchSearchProductList(searchProduct: event.query);
        emit(ProductBlocDataLoaded(productList: searchResults));
      } catch (e) {
        emit(ProductBlocError(errorMessage: e.toString()));
      }
    });
    on<SortingOrderProductEvent>((event, emit) async {
      emit(ProductBlocLoading());
      try {
        final sortedList = await productRepository.fetchSortedProductList(
          sortBy: event.sortBy,
          order: event.orderQuery,
        );
        emit(ProductBlocDataLoaded(productList: sortedList));
      } catch (e) {
        emit(ProductBlocError(errorMessage: e.toString()));
      }
    });

  }

}