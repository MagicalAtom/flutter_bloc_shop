import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/Category/category_bloc.dart';
import 'package:online_shop/bloc/CategoryProduct/category_product_bloc.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/config/data.dart';
import 'package:online_shop/data/models/Category.dart';
import 'package:online_shop/extension/Navigator.dart';
import 'package:online_shop/helper/helper.dart';
import 'package:online_shop/screens/product_list_screen.dart';
import 'package:online_shop/widgets/appbar_widget.dart';
import 'package:online_shop/widgets/cache_image.dart';
import 'package:shimmer/shimmer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(
        CategoryRequestEvent()); // بعد از لود شدن صفحه درخواست بره سمت بلاک تا اطلاعات رو بده
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AppBarWidget(
                child: const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'دسته بندی',
                        style: TextStyle(
                            color: ColorConfig.main,
                            fontFamily: 'SM',
                            fontSize: 19,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return const SliverToBoxAdapter(
                      child: LinearProgressIndicator());
                } else if (state is CategoryShowState) {
                  return state.categories.fold((failed) {
                    return const SliverToBoxAdapter(
                        child: Text('لطفا اینترنت خود را بررسی کنید'));
                  }, (success) {
                    return _GenerateItemList(category: success);
                  });
                }
                return SliverToBoxAdapter(child: Text('Error'));
              },
            )
          ],
        ),
      ),
    );
  }
}

class _GenerateItemList extends StatelessWidget {
  List<CategoryModel> category;
  _GenerateItemList({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return GestureDetector(
            onTap: () {
              to(
                  context: context,
                  route: BlocProvider<CategoryProductBloc>(
                    create: (context) => CategoryProductBloc(),
                    child: ProductListScreen(category: category[index]),
                  ));
            },
            child: CacheImage(
              imageUrl: Helper.getFilePath(
                  collectionId: category[index].collectionId,
                  recordId: category[index].id,
                  filename: category[index].thumbnail),
            ),
          );
        }, childCount: category.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 190,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
