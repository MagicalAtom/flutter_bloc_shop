import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/Category/category_bloc.dart';
import 'package:online_shop/bloc/Home/home_bloc.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/screens/basket_screen.dart';
import 'package:online_shop/screens/category_screen.dart';
import 'package:online_shop/screens/loading_screen.dart';
import 'package:online_shop/screens/user_profile_screen.dart';
import 'package:online_shop/widgets/appbar_widget.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';
import 'package:online_shop/widgets/home_screen/generate_category_items_home.dart';
import 'package:online_shop/widgets/home_screen/most_popular_products_home.dart';
import 'package:online_shop/widgets/home_screen/most_sale_home_generate.dart';
import 'package:online_shop/widgets/home_screen/text_icon_home.dart';
import 'package:online_shop/widgets/slider_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tapChanged = 0;
  List<Widget> pages = [
    BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: MyApp(),
    ),
    const BasketScreen(),
    BlocProvider<CategoryBloc>(
      create: (context) => CategoryBloc(),
      child: const CategoryScreen(),
    ),
    const UserProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
          child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                tapChanged = value;
              });
            },
            currentIndex: tapChanged,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedLabelStyle: const TextStyle(
              fontSize: 13,
              fontFamily: 'SM',
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 13,
              fontFamily: 'SM',
              fontWeight: FontWeight.w700,
            ),
            backgroundColor: Colors.transparent,
            items: [
              items('assets/images/icon_home.png',
                  'assets/images/icon_home_active.png', 'خانه'),
              items('assets/images/icon_basket.png',
                  'assets/images/icon_basket_active.png', 'سبد خرید'),
              items('assets/images/icon_category.png',
                  'assets/images/icon_category_active.png', 'دسته بندی'),
              items('assets/images/icon_profile.png',
                  'assets/images/icon_profile_active.png', 'حساب کاربری'),
            ],
          ),
        ),
      ),
      backgroundColor: ColorConfig.white,
      body: IndexedStack(
        index: tapChanged,
        children: pages,
      ),
    );
  }

  BottomNavigationBarItem items(String icon, String active, String lable) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: ColorConfig.main,
                blurRadius: 20,
                spreadRadius: -7,
                offset: Offset(0.0, 13),
              )
            ]),
            child: Image.asset(icon),
          ),
        ),
        // active icon
        activeIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: ColorConfig.main,
                blurRadius: 20,
                spreadRadius: -7,
                offset: Offset(0.0, 13),
              )
            ]),
            child: Image.asset(active),
          ),
        ),
        label: lable);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeRequestEvent()); // send event for request data in home screen
  }


// using bloc Builder for use HomeBloc
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return HomeScreen(context, state);
      },
    );
  }


// state
// استیت رو از بالا دریافت کردیم و اینجا تو این ویجت به راحتی هر جا رو میخوایم میتونیم تغییر بدیم و از بلاک استفاده کنیم
  Widget HomeScreen(context, state) {
    if (state is HomeLoadingState) {
      return const LoadingScreen();
    } else if (state is HomeRequestResponseState) {
      return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: AppBarWidget(
                child: Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          color: Colors.white,
                          width: 270,
                          child: const Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 16,
                                  color: ColorConfig.grey),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(12),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'جستحوی محصولات',
                                  hintStyle: TextStyle(
                                      fontFamily: 'SM',
                                      fontSize: 16,
                                      color: ColorConfig.grey)),
                            ),
                          ),
                        ),
                        Image.asset('assets/images/icon_search.png'),
                      ],
                    ),
                  ),
                ),
              ),
            ),



            // *************************** Top Slider *************************** //
            state.banners.fold((faild) {
              return const SliverToBoxAdapter(
                  child: Text('خطا داده ها در دسترس نیست'));
            }, (success) {
              return SliverToBoxAdapter(
                child: SliderWidget(
                    duration: const Duration(seconds: 4),
                    curve: Curves.linear,
                    children: [...success]),
              );
            }),
            // *************************** End Top Slider *************************** //









            // *************************** Categories *************************** //
            // categories section title
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      text: 'دسته بندی',
                      fontFamily: 'SM',
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
            ),


            state.categories.fold(
              (faild) {
                return const SliverToBoxAdapter(
                  child: Text('داده های برنامه فعلا در دسترس نیست'),
                );
              },
              (success) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                      height: 88, child: generateCategoryItems(success)),
                );
              },
            ),


            // *************************** End  Categories *************************** //












            // *************************** Most popular product *************************** //
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextIconWidget(),
                    CustomText(
                      text: 'پرفروش ترین ها',
                      fontFamily: 'SM',
                      fontSize: 13,
                    ),
                  ],
                ),
              ),
            ),
            // generate Product ******************

            state.HottestProduct.fold((faild) {
              return const SliverToBoxAdapter(
                child: Text('داده های برنامه در دسترس نیست'),
              );
            }, (success) {
              return MostPopularProducts(
                products: success,
              );
            }),

            // ***************************  End  Most popular product *************************** //


            // *************************** Most popular product *************************** //
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextIconWidget(),
                    CustomText(
                      text: 'پربازدید ترین ها',
                      fontFamily: 'SM',
                      fontSize: 13,
                    ),
                  ],
                ),
              ),
            ),
            state.HottestProduct.fold((faild) {
              return const SliverToBoxAdapter(
                child: Text('خطا داده های برنامه در دسترس نیست'),
              );
            }, (success) {
              return mostSaleProducts(BestSellerProduct: success);
            })
          ],
        )),
      );
    }
    return const  Text('Error');
  }



}

