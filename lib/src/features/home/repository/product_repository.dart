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
import 'package:e_commerce_product_listing_app/src/utility/app_urls/app_urls.dart';

class ProductRepository {
  // Future<List<Products>> fetchProductList() async {
  //   NetworkResponse response = await NetworkCaller.getRequest(Urls.productUrl);
  //
  //   log("getRequest statusCode ==> ${response.statusCode}");
  //   log("getRequest body ==> ${response.body}");
  //
  //   if (response.isSuccess) {
  //     Map<String, dynamic> jsonData = response.body;
  //     ProductModel productModel = ProductModel.fromJson(jsonData);
  //     return productModel.products ?? [];
  //   } else {
  //     throw Exception('Failed to fetch data');
  //   }
  // }

  Future<List<Products>> fetchProductList({int skip = 0, int limit = 20}) async {
    final String url = 'https://dummyjson.com/products?limit=$limit&skip=$skip';
    NetworkResponse response = await NetworkCaller.getRequest(url);

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




  Future<List<Products>> fetchSearchProductList({required String searchProduct}) async {
    NetworkResponse response = await NetworkCaller.getRequest(Urls.searchProductUrl(searchProduct));

    log("get searchProduct statusCode ==> ${response.statusCode}");
    log("get searchProduct body ==> ${response.body}");

    if (response.isSuccess) {
      Map<String, dynamic> jsonData = response.body;
      ProductModel productModel = ProductModel.fromJson(jsonData);
      return productModel.products ?? [];
    } else {
      throw Exception('Failed to fetch search data');
    }
  }

  Future<List<Products>> fetchSortedProductList({required String sortBy, required String order}) async {
    NetworkResponse response = await NetworkCaller.getRequest(Urls.orderQueryUrl(sortBy, order));
    log("Sorted Product => ${response.statusCode}");

    if (response.isSuccess) {
      Map<String, dynamic> jsonData = response.body;
      return ProductModel.fromJson(jsonData).products ?? [];
    } else {
      throw Exception('Failed to fetch sorted product list');
    }
  }



}