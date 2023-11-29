import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/data/models/BasketItem.dart';
import 'package:online_shop/helper/helper.dart';
import 'package:online_shop/services/Hive/Hive.dart';
import 'package:online_shop/widgets/appbar_widget.dart';
import 'package:online_shop/widgets/cache_image.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  var basketBox = hive.open<BasketItem>('BasketBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          height: 56,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: ColorConfig.green,
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: CustomText(
              text: 'ادامه فرآیند خرید',
              color: Colors.white,
              fontFamily: 'SM',
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: AppBarWidget(
                    child: const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'سبد خرید',
                                  style: TextStyle(
                                      color: ColorConfig.main,
                                      fontFamily: 'SM',
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 28),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: ValueListenableBuilder(
                    valueListenable: basketBox.values,
                    builder: (context, value, child) {
                    return SliverList(
                      // This is not scrolldirection
                      delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            var boxValue = basketBox.values.toList()[index];
                            return BasketBox(
                              SingleBasketItem: boxValue,
                              );
                          },
                          childCount: basketBox.values.toList().length),
                    );  
                    },
                     
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BasketBox extends StatelessWidget {
  BasketBox({
    super.key,
    required this.SingleBasketItem,
  });

  BasketItem SingleBasketItem;


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, right: 19),
                    child: SizedBox(
                      width: 83,
                      child: CacheImage(imageUrl: Helper.getFilePath(
                          collectionId: SingleBasketItem.collectionId,
                          recordId: SingleBasketItem.id,
                          filename: SingleBasketItem.thumbnail),),
                    )
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: SingleBasketItem.name,
                          color: Colors.black,
                          fontFamily: 'SM',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        CustomText(
                          text: 'گارانتی 18 ماه مدیا پردازش',
                          color: ColorConfig.grey,
                          fontFamily: 'SM',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: SingleBasketItem.realPrice.toString() +  ' تومان',
                              color: ColorConfig.grey,
                              fontFamily: 'SM',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 30,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: const Color(0xffd02026),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Center(
                                child: CustomText(
                                  text: SingleBasketItem.persent!.toStringAsFixed(0) + '%',
                                  color: Colors.white,
                                  fontFamily: 'SM',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 98,
                              height: 34,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: ColorConfig.grey.withOpacity(.7),
                                  ),
                                  borderRadius: BorderRadius.circular(13)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: '256 گیگابایت',
                                    fontFamily: 'SM',
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff858585),
                                  ),
                                  Image.asset(
                                    'assets/images/option.png',
                                    width: 11,
                                    fit: BoxFit.cover,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 115,
                              height: 34,
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: ColorConfig.grey.withOpacity(.7),
                                  ),
                                  borderRadius: BorderRadius.circular(13)),
                              child: Row(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                        color: Colors.green[900],
                                        shape: BoxShape.circle),
                                  ),
                                 const  SizedBox(
                                    width: 5,
                                  ),
                                  CustomText(
                                    text: 'سبز کله غازی',
                                    fontFamily: 'SM',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff858585),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Image.asset(
                                    'assets/images/option.png',
                                    width: 11,
                                    fit: BoxFit.cover,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 30,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: ColorConfig.grey.withOpacity(.7),
                                  ),
                                  borderRadius: BorderRadius.circular(13)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: '1',
                                    fontFamily: 'SM',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff858585),
                                  ),
                                  Image.asset(
                                    'assets/images/option.png',
                                    width: 10,
                                    fit: BoxFit.cover,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 70,
                              height: 30,
                              padding: const  EdgeInsets.symmetric(horizontal: 7),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: ColorConfig.grey.withOpacity(.7),
                                  ),
                                  borderRadius: BorderRadius.circular(13)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/active_fav_product.png',
                                    width: 16,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  CustomText(
                                    text: 'ذخیره',
                                    fontFamily: 'SM',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff858585),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 70,
                              height: 30,
                              padding: const EdgeInsets.symmetric(horizontal: 7),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: ColorConfig.grey.withOpacity(.7),
                                  ),
                                  borderRadius: BorderRadius.circular(13)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/trash.png',
                                    width: 16,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  CustomText(
                                    text: 'حذف',
                                    fontFamily: 'SM',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff858585),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DottedLine(
                  dashColor: ColorConfig.grey.withOpacity(.3),
                  lineThickness: 2,
                  dashLength: 7,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: SingleBasketItem.price.toString(),
                    color: Colors.black,
                    fontFamily: 'SM',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  CustomText(
                    text: 'تومان',
                    color: Colors.black,
                    fontFamily: 'SM',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
