

import 'package:e_commerce_product_listing_app/src/features/home/models/product_models.dart';
import 'package:e_commerce_product_listing_app/src/services/network_caller.dart';
import 'package:e_commerce_product_listing_app/src/services/network_response.dart';

class ProductRepository{
  Future<List<ProductModel>> fetchProductList()async{
    NetworkResponse response = await  NetworkCaller.getRequest("https://dummyjson.com/products");

    if(response.isSuccess){
      List<dynamic>jsonData = response.body;
      return jsonData.map((json)=> ProductModel.fromJson(json)).toList();
    }else{
      throw Exception('Failed to fetch data');
    }
  }
}