
import 'package:flutter/material.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';
import 'package:readmore/readmore.dart';

class ProductDescription extends StatefulWidget {
   ProductDescription({
    super.key,
    required this.description,
  });
  String description;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool showdescription = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          GestureDetector(
             onTap: () {
                    setState(() {
                      showdescription = showdescription ? false : true;
                    });
                  },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 15),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1.5,
                        color: ColorConfig.grey.withOpacity(.7))),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'توضیحات محصول',
                        fontFamily: 'SM',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: showdescription ? false : true,
                            child: CustomText(
                              text: 'مشاهده',
                              fontFamily: 'SM',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: ColorConfig.main,
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          RotatedBox(quarterTurns: showdescription ? 3 : 0,child: Image.asset('assets/images/open.png')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(visible: showdescription,child: const SizedBox(height: 10,)),
           Visibility(
            visible: showdescription,
            maintainAnimation: true,
            maintainState: true,  
             child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: AnimatedOpacity(
                opacity: showdescription ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: 1.5,
                          color: ColorConfig.grey.withOpacity(.7))),
                  child: ReadMoreText(
                    widget.description,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontFamily: 'SM',
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    trimExpandedText: ' حذف ',
                    trimCollapsedText: ' ادامه ',
                    delimiterStyle: const TextStyle(color: Colors.blueAccent,fontSize: 20), 
                    moreStyle: const TextStyle(
                      fontFamily: 'SM',
                      fontSize: 17,
                      color: Colors.blueAccent,
                    ),       
                    lessStyle: const TextStyle(
                      fontFamily: 'SM',
                      fontSize: 17,
                      color: Colors.blueAccent,
                    ),             
                  )
                ),
              ),
                     ),
           ),
        ],
      ),
    );
  }
}