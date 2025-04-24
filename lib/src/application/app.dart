// import 'package:e_commerce_product_listing_app/src/features/home/views/screens/home_page.dart';
// import 'package:e_commerce_product_listing_app/src/utility/styles/app_colors.dart';
// import 'package:flutter/material.dart';
//
// class ECommerceApp extends StatelessWidget {
//   const ECommerceApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'E-Commerce App',
//       theme: ThemeData(
//         inputDecorationTheme: InputDecorationTheme(
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8)
//             ),
//             filled: true,
//             fillColor: AppColors.whiteTextColor,
//
//             hintStyle: TextStyle(color: AppColors.secondaryTextColor)
//         ),
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const HomePage(),
//     );
//   }
// }


// import 'package:e_commerce_product_listing_app/src/utility/internet_connectivity/bloc/internet_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:e_commerce_product_listing_app/src/features/home/views/screens/home_page.dart';
// import 'package:e_commerce_product_listing_app/src/utility/styles/app_colors.dart';
//
//
// class ECommerceApp extends StatelessWidget {
//   const ECommerceApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => InternetBloc(Connectivity()),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'E-Commerce App',
//         theme: ThemeData(
//           inputDecorationTheme: InputDecorationTheme(
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//             filled: true,
//             fillColor: AppColors.whiteTextColor,
//             hintStyle: TextStyle(color: AppColors.secondaryTextColor),
//           ),
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         ),
//         home: const HomePage(),
//       ),
//     );
//   }
// }
import 'package:e_commerce_product_listing_app/src/utility/internet_connectivity/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_product_listing_app/src/features/home/views/screens/home_page.dart';
import 'package:e_commerce_product_listing_app/src/utility/internet_connectivity/bloc/internet_state.dart';
import 'package:e_commerce_product_listing_app/src/utility/styles/app_colors.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(Connectivity()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: AppColors.whiteTextColor,
            hintStyle: TextStyle(color: AppColors.secondaryTextColor),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: BlocListener<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetDisconnectedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('No Internet Connection'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 3),
                ),
              );
            } else if (state is InternetConnectedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Back Online'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: const HomePage(),
        ),
      ),
    );
  }
}