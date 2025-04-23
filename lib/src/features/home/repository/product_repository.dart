// import 'dart:developer';
//
// import 'package:e_commerce_product_listing_app/src/features/home/models/product_models.dart';
// import 'package:e_commerce_product_listing_app/src/services/network_caller.dart';
// import 'package:e_commerce_product_listing_app/src/services/network_response.dart';
//
// class ProductRepository{
//   Future<List<Products>> fetchProductList()async{
//     NetworkResponse response = await  NetworkCaller.getRequest("https://dummyjson.com/products");
//
//     log("getRequest statusCode ==> ${response.statusCode}");
//     log("getRequest body ==> ${response.body}");
//
//     if(response.isSuccess){
//       List<dynamic>jsonData = response.body;
//       return jsonData.map((json)=> Products.fromJson(json)).toList();
//     }else{
//       throw Exception('Failed to fetch data');
//     }
//   }
// }

import 'dart:developer';
import 'package:e_commerce_product_listing_app/src/features/home/models/product_models.dart';
import 'package:e_commerce_product_listing_app/src/services/network_caller.dart';
import 'package:e_commerce_product_listing_app/src/services/network_response.dart';

class ProductRepository {
  Future<List<Products>> fetchProductList() async {
    NetworkResponse response = await NetworkCaller.getRequest("https://dummyjson.com/products");

    log("getRequest statusCode ==> ${response.statusCode}");
    log("getRequest body ==> ${response.body}");

    if (response.isSuccess) {
      Map<String, dynamic> jsonData = response.body;
      ProductModel productModel = ProductModel.fromJson(jsonData);
      return productModel.products ?? [];
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}