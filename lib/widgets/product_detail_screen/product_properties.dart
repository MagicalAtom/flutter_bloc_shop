import 'package:flutter/material.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/data/models/ProductProperty.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';
import 'package:readmore/readmore.dart';

class ProductProprtyWidget extends StatefulWidget {
  ProductProprtyWidget({
    super.key,
    required this.description,
  });
  List<ProductProprty> description;

  @override
  State<ProductProprtyWidget> createState() => _ProductProprtyWidgetState();
}

class _ProductProprtyWidgetState extends State<ProductProprtyWidget> {
  @override
  void initState() {
    super.initState();
  }

  bool showProperties = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(height: 20,),

          GestureDetector(
            onTap: () {
              setState(() {
                showProperties = showProperties ? false : true;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1.5, color: ColorConfig.grey.withOpacity(.7))),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'مشخصات فنی',
                        fontFamily: 'SM',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: showProperties ? false : true,
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
                          RotatedBox(
                              quarterTurns: showProperties ? 3 : 0,
                              child: Image.asset('assets/images/open.png')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
              visible: showProperties,
              child: const SizedBox(
                height: 10,
              )),
          Visibility(
            visible: showProperties,
            maintainAnimation: true,
            maintainState: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: AnimatedOpacity(
                opacity: showProperties ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: AnimatedContainer(
                    height: 210,
                    duration: const Duration(milliseconds: 500),
                   
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 1.5,
                            color: ColorConfig.grey.withOpacity(.7))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            itemCount: widget.description.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Directionality(
                                textDirection: TextDirection.rtl,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 7),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.description[index].title + ' : ',
                                        style: const TextStyle(
                                          fontSize: 13,
                                            color: Colors.black, fontFamily: 'SM'),
                                        textAlign: TextAlign.right,
                                      ),
                                                              
                                        Text(
                                        widget.description[index].value,
                                        style: const TextStyle(
                                          fontSize: 13,
                                            color: Colors.black, fontFamily: 'SM'),
                                        textAlign: TextAlign.right,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
