// import 'package:e_commerce_product_listing_app/src/features/home/bloc/product_bloc.dart';
// import 'package:e_commerce_product_listing_app/src/features/home/bloc/product_bloc_event.dart';
// import 'package:e_commerce_product_listing_app/src/features/home/bloc/product_bloc_state.dart';
// import 'package:e_commerce_product_listing_app/src/features/home/models/product_models.dart';
// import 'package:e_commerce_product_listing_app/src/features/home/views/widgets/product_card_widget.dart';
// import 'package:e_commerce_product_listing_app/src/utility/assets_path/assets_path.dart';
// import 'package:e_commerce_product_listing_app/src/utility/styles/app_colors.dart';
// import 'package:e_commerce_product_listing_app/src/utility/styles/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   TextEditingController _searchTEController = TextEditingController();
//
//   @override
//   void initState() {
//     context.read<ProductBloc>().add(FetchAllProductEvent());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size  = MediaQuery.sizeOf(context);
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.only(
//           top: size.height * 0.065,
//           left: size.height * k16TextSize,
//           right: size.height * k16TextSize,
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 SizedBox(
//                   width: size.width * 0.78,
//                   child: TextFormField(
//                     onChanged: (query) {
//                       context.read<ProductBloc>().add(SearchProductEvent(query));
//                     },
//                     controller: _searchTEController,
//                     decoration: const InputDecoration(
//                       prefixIcon: Icon(Icons.search),
//                       hintText: 'Search Anything...',
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 GestureDetector(
//                   onTap: () {
//                     _showSortBottomSheet(context);
//                   },
//                   child: SvgPicture.asset(AssetsPath.filterIconSVG),
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 16),
//
//             Expanded(
//               child: BlocBuilder<ProductBloc, ProductBlocState>(
//                 builder: (context, state) {
//                   if (state is ProductBlocLoading) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (state is ProductBlocDataLoaded) {
//                     return GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: size.height * k16TextSize,
//                         mainAxisSpacing: size.height * k16TextSize,
//                         childAspectRatio: 0.7,
//                       ),
//                       itemCount: state.productList.length,
//                       itemBuilder: (context, index) {
//                         return ProductCard(product: state.productList[index]);
//                       },
//                     );
//                   } else if (state is ProductBlocError) {
//                     return Center(child: Text(state.errorMessage));
//                   } else {
//                     return const SizedBox();
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showSortBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Sort By',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.close),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               GestureDetector(
//                 onTap: (){
//                   context.read<ProductBloc>().add(SortingOrderProductEvent('price', 'asc'));
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   'Price - High to Low',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//               SizedBox(height: 16),
//               GestureDetector(
//                 onTap: (){
//                   context.read<ProductBloc>().add(SortingOrderProductEvent('price', 'desc'));
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   'Price - Low to High',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//               SizedBox(height: 16),
//               GestureDetector(
//                 onTap: (){
//                   context.read<ProductBloc>().add(SortingOrderProductEvent('rating', 'desc'));
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   'Rating',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//               SizedBox(height: 16),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//
//
// }


// import 'package:e_commerce_product_listing_app/src/features/home/bloc/product_bloc.dart';
// import 'package:e_commerce_product_listing_app/src/features/home/bloc/product_bloc_event.dart';
// import 'package:e_commerce_product_listing_app/src/features/home/bloc/product_bloc_state.dart';
// import 'package:e_commerce_product_listing_app/src/features/home/models/product_models.dart';
// import 'package:e_commerce_product_listing_app/src/features/home/views/widgets/product_card_widget.dart';
// import 'package:e_commerce_product_listing_app/src/utility/assets_path/assets_path.dart';
// import 'package:e_commerce_product_listing_app/src/utility/styles/app_colors.dart';
// import 'package:e_commerce_product_listing_app/src/utility/styles/constant.dart';
// import 'package:e_commerce_product_listing_app/src/utility/internet_connectivity/bloc/internet_bloc.dart';
// import 'package:e_commerce_product_listing_app/src/utility/internet_connectivity/bloc/internet_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final TextEditingController _searchTEController = TextEditingController();
//
//   @override
//   void initState() {
//     final internetState = context.read<InternetBloc>().state;
//     if (internetState is InternetConnectedState) {
//       context.read<ProductBloc>().add(FetchAllProductEvent());
//     } else {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Check your internet connection'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       });
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.sizeOf(context);
//
//     return Scaffold(
//       body: BlocListener<InternetBloc, InternetState>(
//         listener: (context, state) {
//           if (state is InternetDisconnectedState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('No Internet Connection'),
//                 backgroundColor: Colors.red,
//                 duration: Duration(seconds: 3),
//               ),
//             );
//           } else if (state is InternetConnectedState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Back Online'),
//                 backgroundColor: Colors.green,
//                 duration: Duration(seconds: 2),
//               ),
//             );
//             context.read<ProductBloc>().add(FetchAllProductEvent());
//           }
//         },
//         child: Padding(
//           padding: EdgeInsets.only(
//             top: size.height * 0.065,
//             left: size.height * k16TextSize,
//             right: size.height * k16TextSize,
//           ),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   SizedBox(
//                     width: size.width * 0.78,
//                     child: TextFormField(
//                       onChanged: (query) {
//                         context.read<ProductBloc>().add(SearchProductEvent(query));
//                       },
//                       controller: _searchTEController,
//                       decoration: const InputDecoration(
//                         prefixIcon: Icon(Icons.search),
//                         hintText: 'Search Anything...',
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   GestureDetector(
//                     onTap: () {
//                       _showSortBottomSheet(context);
//                     },
//                     child: SvgPicture.asset(AssetsPath.filterIconSVG),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Expanded(
//                 child: BlocBuilder<ProductBloc, ProductBlocState>(
//                   builder: (context, state) {
//                     if (state is ProductBlocLoading) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (state is ProductBlocDataLoaded) {
//                       return GridView.builder(
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: size.height * k16TextSize,
//                           mainAxisSpacing: size.height * k16TextSize,
//                           childAspectRatio: 0.7,
//                         ),
//                         itemCount: state.productList.length,
//                         itemBuilder: (context, index) {
//                           return ProductCard(product: state.productList[index]);
//                         },
//                       );
//                     } else if (state is ProductBlocError) {
//                       return Center(child: Text(state.errorMessage));
//                     } else {
//                       return const SizedBox();
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showSortBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Sort By',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.close),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               GestureDetector(
//                 onTap: () {
//                   context.read<ProductBloc>().add(SortingOrderProductEvent('price', 'asc'));
//                   Navigator.pop(context);
//                 },
//                 child: const Text('Price - High to Low', style: TextStyle(fontSize: 16)),
//               ),
//               const SizedBox(height: 16),
//               GestureDetector(
//                 onTap: () {
//                   context.read<ProductBloc>().add(SortingOrderProductEvent('price', 'desc'));
//                   Navigator.pop(context);
//                 },
//                 child: const Text('Price - Low to High', style: TextStyle(fontSize: 16)),
//               ),
//               const SizedBox(height: 16),
//               GestureDetector(
//                 onTap: () {
//                   context.read<ProductBloc>().add(SortingOrderProductEvent('rating', 'desc'));
//                   Navigator.pop(context);
//                 },
//                 child: const Text('Rating', style: TextStyle(fontSize: 16)),
//               ),
//               const SizedBox(height: 16),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:e_commerce_product_listing_app/src/features/home/bloc/product_bloc.dart';
import 'package:e_commerce_product_listing_app/src/features/home/bloc/product_bloc_event.dart';
import 'package:e_commerce_product_listing_app/src/features/home/bloc/product_bloc_state.dart';
import 'package:e_commerce_product_listing_app/src/features/home/models/product_models.dart';
import 'package:e_commerce_product_listing_app/src/features/home/views/widgets/product_card_widget.dart';
import 'package:e_commerce_product_listing_app/src/utility/assets_path/assets_path.dart';
import 'package:e_commerce_product_listing_app/src/utility/styles/app_colors.dart';
import 'package:e_commerce_product_listing_app/src/utility/styles/constant.dart';
import 'package:e_commerce_product_listing_app/src/utility/internet_connectivity/bloc/internet_bloc.dart';
import 'package:e_commerce_product_listing_app/src/utility/internet_connectivity/bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Check initial internet state
    final internetState = context.read<InternetBloc>().state;
    if (internetState is InternetConnectedState) {
      context.read<ProductBloc>().add(FetchAllProductEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.065,
          left: size.height * k16TextSize,
          right: size.height * k16TextSize,
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.78,
                  child: TextFormField(
                    onChanged: (query) {
                      context.read<ProductBloc>().add(SearchProductEvent(query));
                    },
                    controller: _searchTEController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search Anything...',
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    _showSortBottomSheet(context);
                  },
                  child: SvgPicture.asset(AssetsPath.filterIconSVG),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductBlocState>(
                builder: (context, state) {
                  if (state is ProductBlocLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductBlocDataLoaded) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: size.height * k16TextSize,
                        mainAxisSpacing: size.height * k16TextSize,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: state.productList.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: state.productList[index]);
                      },
                    );
                  } else if (state is ProductBlocError) {
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sort By',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  context.read<ProductBloc>().add(SortingOrderProductEvent('price', 'asc'));
                  Navigator.pop(context);
                },
                child: const Text('Price - High to Low', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  context.read<ProductBloc>().add(SortingOrderProductEvent('price', 'desc'));
                  Navigator.pop(context);
                },
                child: const Text('Price - Low to High', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  context.read<ProductBloc>().add(SortingOrderProductEvent('rating', 'desc'));
                  Navigator.pop(context);
                },
                child: const Text('Rating', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}