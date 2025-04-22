import 'package:e_commerce_product_listing_app/src/features/home/models/product_models.dart';
import 'package:e_commerce_product_listing_app/src/features/home/views/widgets/product_card_widget.dart';
import 'package:e_commerce_product_listing_app/src/utility/assets_path/assets_path.dart';
import 'package:e_commerce_product_listing_app/src/utility/styles/app_colors.dart';
import 'package:e_commerce_product_listing_app/src/utility/styles/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: size.height * 0.065,left: size.height * k16TextSize,right: size.height * k16TextSize),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.78,
                  child: TextFormField(
                    controller: _searchTEController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search Anything...',
                    ),

                  ),
                ),
                Spacer(),
                GestureDetector(
                    onTap: (){
                      _showSortBottomSheet(context);
                    },

                    child: SvgPicture.asset(AssetsPath.filterIconSVG))
              ],
            ),

            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: size.height * k16TextSize,
                  mainAxisSpacing: size.height * k16TextSize,
                  childAspectRatio: 0.7,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
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
                  Text(
                    'Sort By',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'PRICE - HIGH TO LOW',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'PRICE - LOW TO HIGH',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'RATING',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }



}
