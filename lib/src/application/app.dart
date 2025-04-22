import 'package:e_commerce_product_listing_app/src/features/home/views/screens/home_page.dart';
import 'package:e_commerce_product_listing_app/src/utility/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            filled: true,
            fillColor: AppColors.whiteTextColor,

            hintStyle: TextStyle(color: AppColors.secondaryTextColor)
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}