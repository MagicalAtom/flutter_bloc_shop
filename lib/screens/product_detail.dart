import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/Basket/basket_bloc.dart';
import 'package:online_shop/bloc/Product/product_bloc.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/data/models/BasketItem.dart';
import 'package:online_shop/data/models/Product.dart';
import 'package:online_shop/data/models/ProductGallery.dart';
import 'package:online_shop/enums/VariantType.dart';
import 'package:online_shop/helper/helper.dart';
import 'package:online_shop/screens/loading_screen.dart';
import 'package:online_shop/services/Hive/Hive.dart';
import 'package:online_shop/widgets/appbar_widget.dart';
import 'package:online_shop/widgets/cache_image.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';
import 'package:online_shop/widgets/product_detail_screen/product_colors_variant.dart';
import 'package:online_shop/widgets/product_detail_screen/product_description.dart';
import 'package:online_shop/widgets/product_detail_screen/product_properties.dart';
import 'package:online_shop/widgets/product_detail_screen/product_storage_variant.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({super.key, required this.product});
  Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   context
  //       .read<ProductBloc>()
  //       // اینجا آیدی محصول رو که از ویجت جنریت محبوب ترین محصولات میاد رو میدیم به بلاک تا بلاک با استفاده از ریپازیتوری و ریپازیتوری با استفاده از دیتاسورس موارد مورد نیاز ما رو بگیره .
  //       .add(ProductDetailRequestEvent(
  //           product_id: widget.product.id,
  //           category_id: widget.product.category));
  // }

  int _selectedImageGalleryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>( // چون از بیرون و هنگام انتقال بسکت بلاک رو فراهم کردیم اینجا میایم و برای دریافت محصول اینکار رو انجام میدیم
      create: (context) {
        var bloc = ProductBloc();
        bloc.add(ProductDetailRequestEvent(product_id: widget.product.id, category_id: widget.product.category)); // اینجا برای گرفتن نام کتگوری محصول آیدی کتگوری رو میفرستیم سمت ای پی آی کتگوری تا اسمش رو دریافت کنیم
        return bloc;
      },
      child: BuildProductDetailContent(),
    );
  }

  Scaffold BuildProductDetailContent() {
    return Scaffold(
    backgroundColor: ColorConfig.white,
    body: BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const LoadingScreen();
        } else if (state is ProductRequestResponseState) {
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                // ********************************** AppBar Widget *********************************** //
                state.productCategory.fold((faild) {
                  return const SliverToBoxAdapter(
                    child: Text('خطا ! داده های برنامه در دسترس نیست'),
                  );
                }, (success) {
                  return SliverToBoxAdapter(
                    child: AppBarWidget(
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    success.title,
                                    style: const TextStyle(
                                        color: ColorConfig.main,
                                        fontFamily: 'SM',
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset('assets/images/back.png'))
                          ],
                        ),
                      ),
                    ),
                  );
                }),

                // ********************************** Product Box Widget *********************************** //
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 12,
                  ),
                ),



                _ProductTitle(productTitle: widget.product.name),


                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 12,
                  ),
                ),
                // ********************************

                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: Card(
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Container(
                        padding: const EdgeInsets.only(
                          bottom: 22,
                        ),
                        width: 330,
                        height: 284,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 10,
                              top: 10,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/star.png'),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  const Text(
                                    '3.3',
                                    style: TextStyle(
                                        fontFamily: 'SM', fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: Image.asset('assets/images/like.png'),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                state.productGallery.fold((faild) {
                                  // گرفتن عکس های گالری محصول
                                  return const Text(
                                      'خطا داده های برنامه در دسترس نیست');
                                }, (success) {
                                  return generateGalleryItems(
                                    // اگه محصول گالری عکس داشته باشه که این ویجت یک آرایه کامل میگیره تو خط 147 و با لیست ویو نمایش میده
                                    GalleryItems: success,
                                    defualtImage: Helper.getFilePath(
                                        // اینجا هم اگه آرایه بالا خالی بود پس عکس دیفالت محصول رو به این صورت نشون میدیم
                                        collectionId:
                                            widget.product.collectionId,
                                        recordId: widget.product.id,
                                        filename: widget.product.thumbnail),
                                  );
                                })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // state.productVariantList.fold(
                //   (faild){
                //     return  const SliverToBoxAdapter(child: Text('داده در دسترس نیست'));
                //   },(success){
                //     for (var product in success) {
                //         print(product.variantType.title);
                //         for (var element in product.varaint) {
                //           print(element.name);
                //         }

                //     }
                //     return const  SliverToBoxAdapter(child: Text('گرفته شد'));
                //   }
                // ),

// **************************** Choose A color *****************************************//
                state.productVariantList.fold(
                  (faild) {
                    return const SliverToBoxAdapter(
                      child: Text('خطا ! داده های برنامه نیست.'),
                    );
                  },
                  (success) {
                    for (var product in success) {
                      /*
                      گفتیم اگه تایپش برابر با کالر هست بیا کالر ورینت هاش رو بفرست سمت این ویجت تا اونور نشونش بدیم
                      */
                      if (product.variantType.type == VariantTypeEnum.Color) {
                        return ColorsVariant(
                          variant: product.varaint,
                        );
                      }
                    }
                    return const SliverToBoxAdapter(
                      child: Text('Error'),
                    );
                  },
                ),

                // ************** Choose a Storage Size   ************* //

                state.productVariantList.fold((faild) {
                  return const SliverToBoxAdapter(
                    child: Text('داده های برنامه در دسترس نیست'),
                  );
                }, (success) {
                  for (var product in success) {
                    if (product.variantType.type == VariantTypeEnum.Storage) {
                      // در اصل میگه اونایی که تایپشون اینه رو برگردون
                      return LocalStorage(variantType: product.varaint);
                    }
                  }
                  return const SliverToBoxAdapter(
                    child: Text('داده های برنامه در دسترس نیست'),
                  );
                }),

                // ******************************* End Select Local Storage ****************************************** //
              
              state.productProperties.fold(
                (faild){
                return const SliverToBoxAdapter(child: Text('خطا داده های برنامه در دسترس نیست'),);
                },
                (success){
                  return ProductProprtyWidget(description: success);
                }
              ),










                //============================ product Description =========================== //

                 ProductDescription(description: widget.product.description,),


                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 22,
                  ),
                ),
                SliverToBoxAdapter(
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
                            Row(
                              children: [
                                CustomText(
                                  text: 'نظرات کاربران',
                                  fontFamily: 'SM',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 14),
                                      height: 26,
                                      width: 10,
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                    ),
                                    Positioned(
                                      right: 5,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(left: 10),
                                        height: 26,
                                        width: 26,
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 15,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(left: 10),
                                        height: 26,
                                        width: 26,
                                        decoration: const BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 30,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(left: 10),
                                        height: 26,
                                        width: 26,
                                        decoration: const BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 45,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(left: 10),
                                        height: 26,
                                        width: 26,
                                        decoration: const BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 60,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(left: 10),
                                        height: 26,
                                        width: 26,
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          '+10',
                                          style: TextStyle(
                                              fontFamily: 'sb',
                                              fontSize: 12,
                                              color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'مشاهده',
                                  fontFamily: 'SM',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: ColorConfig.main,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Image.asset('assets/images/open.png'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    child: Row(
                      children: [
                        Expanded(
                            child: AddToBasketButton(
                                text: 'افزودن به سبد خرید',product: widget.product,)),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: PriceBoxProduct(
                          color: const Color(0xff1DB68B),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: [
                                CustomText(
                                  text: 'تومان',
                                  color: Colors.white,
                                  fontFamily: 'SM',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    CustomText(
                                      text: '17,800,000',
                                      color: Colors.white,
                                      fontFamily: 'SM',
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                      decorationStyle:
                                          TextDecorationStyle.double,
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    CustomText(
                                      text: '16,989,000',
                                      color: Colors.white,
                                      fontFamily: 'SM',
                                      fontSize: 16,
                                      decoration: TextDecoration.lineThrough,
                                      decorationStyle:
                                          TextDecorationStyle.double,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  width: 30,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xffd02026),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: '5%',
                                      color: Colors.white,
                                      fontFamily: 'SM',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 30),
                ),
              ],
            ),
          );
        }
        return const Text('خطا');
      },
    ),
  );
  }

  Widget generateGalleryItems(
      // کل عکس های محصول در این ویجت قرار دارد
      {required List<ProductGallery> GalleryItems,
      String defualtImage = ''}) {
    return Column(
      children: [
        SizedBox(
            width: 100,
            child: CacheImage(
                imageUrl: GalleryItems.isEmpty // اگه محصول گالری نداشت 
                    ? defualtImage // عکس پیشفرض
                    : Helper.getFilePath(
                        collectionId: GalleryItems[_selectedImageGalleryIndex] // در غیر این صورت عکس انتخاب شده از گالری که برای شروع ما مقدار متغیر سلکتدایمیج... رو برابر با 0 قرار دادیم که اولین عکس گالری رو بیرون بکشه
                            .collectionId,
                        recordId: GalleryItems[_selectedImageGalleryIndex].id,
                        filename:
                            GalleryItems[_selectedImageGalleryIndex].image))),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 75,
          child: ListView.builder(
            itemCount: GalleryItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _GalleyItem(
                  index,
                  Helper.getFilePath(
                      collectionId: GalleryItems[index].collectionId,
                      recordId: GalleryItems[index].id,
                      filename: GalleryItems[index].image));
            },
          ),
        ),
      ],
    );
  }

  GestureDetector _GalleyItem(int index, String image) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedImageGalleryIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: _selectedImageGalleryIndex == index
              ? const Color(0xff858585).withOpacity(.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Center(
            child: SizedBox(
                width: 34,
                height: 34,
                child: CacheImage(
                  imageUrl: image,
                ))),
      ),
    );
  }
}


class _ProductTitle extends StatelessWidget {
  _ProductTitle({
    super.key,
    required this.productTitle,
  });
  String productTitle;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: productTitle,
            fontFamily: 'SM',
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  AddToBasketButton({super.key, required this.text,required this.product});

  String text;
  Product product; // محصولی که اومده به صفحه جزئیات محصول بالاتر در دسترسه دیگه میدیم مواردش رو به این اگه نیاز باشه بهش اضافه بشه به سبد خرید . 

// وقتی روی دیگه کلیک بشه این میاد محصول رو کامل اضافه میکنه به سبد خرید
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BasketItem productAddedToBoxWheneClckThisButton = BasketItem(product.id, product.collectionId, product.thumbnail, product.discount_price,product.price, product.name, product.category);

        context.read<ProductBloc>().add(AddToBasketEvent(product: productAddedToBoxWheneClckThisButton));
        context.read<BasketBloc>().add(RequestBasketEvent());
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 140,
            height: 47,
            decoration: BoxDecoration(
              color: ColorConfig.main,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            top: 6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  width: 160,
                  height: 53,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1.5, color: Colors.white)),
                  child: Center(
                    child: Text(
                      text,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'SM',
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PriceBoxProduct extends StatelessWidget {
  PriceBoxProduct({super.key, required this.child, required this.color});

  Widget child;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 140,
          height: 47,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          top: 6,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                width: 160,
                height: 53,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1.5, color: Colors.white)),
                child: Center(
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
