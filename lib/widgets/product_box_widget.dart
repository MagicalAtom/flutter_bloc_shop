import 'package:flutter/material.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/widgets/cache_image.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';
import 'package:online_shop/widgets/height_space_widget.dart';
import 'package:online_shop/widgets/width_space_widget.dart';

class ProductBox extends StatelessWidget {
  ProductBox({
    super.key,
    required this.productImage, // this project use cache Image ,
    required this.discount,
    required this.price,
    required this.title,
  });
  String productImage;

  /// if the first element of the array (means the index 0 of the array) is true,
  /// it means that the discount is valid, then you enter the new price of the product in the index one of the array,
  ///  like [true,12000$ (new product after discount),discountPercent]
  List discount;
  String price;
  String title;
  /// real price

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 220,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
              top: 40,
              child: Align(
                alignment: AlignmentDirectional.topCenter,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CacheImage(
                    imageUrl: productImage,
                  ),
                ),
              )),
          Positioned(
              right: 10,
              top: 10,
              child: Image.asset('assets/images/active_fav_product.png',width: 24,height: 24,fit: BoxFit.cover,)),
          discount[0]
              ? Positioned(
                  bottom: 82,
                  left: 5,
                  child: Badge(
                    backgroundColor: ColorConfig.red,
                    textColor: Colors.white,
                    largeSize: 20,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    label: CustomText(
                      text: discount[0] ? "%" + discount[2].toString() : '',
                      fontFamily: 'GM',
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ))
              : Positioned(child: Container()),
        

                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Positioned(
                    bottom: 58,
                    child: SizedBox(
                      width: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: title,
                            fontFamily: 'SM',
                            fontSize: 14,
                            overflowText: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


          Container(
            height: 53,
            decoration: const BoxDecoration(
              color: ColorConfig.main,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    color: ColorConfig.main,
                    blurRadius: 25,
                    spreadRadius: -12,
                    offset: Offset(0.0, 15)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomText(
                    text: 'تومان',
                    fontFamily: 'SM',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  Width(size: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: discount[1].toString(),
                        fontFamily: 'SM',
                        fontSize: discount[0] ? 11 : 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        decoration: discount[0]
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                      discount[0]
                          ? CustomText(
                              text: price,
                              fontFamily: 'SM',
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )
                          : Container(),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/icon_right_arrow_circle.png',
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
