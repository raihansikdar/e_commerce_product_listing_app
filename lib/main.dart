import 'package:e_commerce_product_listing_app/src/application/app.dart';
import 'package:e_commerce_product_listing_app/src/features/home/bloc/product_bloc.dart';
import 'package:e_commerce_product_listing_app/src/features/home/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_)=> ProductBloc(ProductRepository()))
  ], child: const ECommerceApp()));
}




