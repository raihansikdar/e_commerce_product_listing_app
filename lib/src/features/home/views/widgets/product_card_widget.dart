import 'package:e_commerce_product_listing_app/src/common_widgets/text_component.dart';
import 'package:e_commerce_product_listing_app/src/features/home/models/product_models.dart';
import 'package:e_commerce_product_listing_app/src/features/home/views/screens/details_page.dart';
import 'package:e_commerce_product_listing_app/src/utility/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../utility/styles/constant.dart';

class ProductCard extends StatelessWidget {

  final Products product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsPage()));
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      product.images?.first ?? '',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.height * k16TextSize * 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextComponent(
                        text:   product.title ?? '',
                        fontWeight: FontWeight.bold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          TextComponent(
                            text: product.price.toString(),
                            fontSize: size.height * k18TextSize,
                            fontWeight: FontWeight.bold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 10,),
                          TextComponent(
                            text: "${product.discountPercentage}%",
                            fontSize: size.height * k14TextSize,
                            fontWeight: FontWeight.w500,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.percentOffColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: AppColors.percentOffColor,
                                borderRadius: BorderRadius.circular(3)
                              ),
                              child: Center(child: Icon(Icons.star, color: AppColors.whiteTextColor, size: 16))),
                          SizedBox(width: 4),
                          TextComponent(
                            text: product.rating.toString(),
                            fontSize: size.height * k18TextSize,
                            fontWeight: FontWeight.bold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 10,),
                          // TextComponent(
                          //   text: "({product.reviews})",
                          //   fontSize: size.height * k14TextSize,
                          //   fontWeight: FontWeight.w500,
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          //   color: AppColors.secondaryTextColor,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: size.height * k16TextSize * 0.5,
              right: size.height * k16TextSize * 0.5,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColors.whiteTextColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            // if (product.isOutOfStock)
            //   Positioned(
            //     top: size.height * k16TextSize * 0.5,
            //     left: size.height * k16TextSize * 0.5,
            //     child: Container(
            //       padding: EdgeInsets.symmetric(
            //         horizontal: size.height * k16TextSize * 0.5,
            //         vertical: size.height * k16TextSize * 0.25,
            //       ),
            //       color: Colors.red,
            //       child:  TextComponent(
            //         text: "Out of Stock",
            //         fontSize: size.height * k12TextSize,
            //         fontWeight: FontWeight.w500,
            //         maxLines: 1,
            //         overflow: TextOverflow.ellipsis,
            //         color: AppColors.whiteTextColor,
            //       ),
            //
            //       /*Text(
            //         'Out of Stock',
            //         style: TextStyle(color: Colors.white, fontSize: 12),
            //       ),*/
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}