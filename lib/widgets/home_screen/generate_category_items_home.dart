
  import 'package:flutter/material.dart';
import 'package:online_shop/data/models/Category.dart';
import 'package:online_shop/helper/helper.dart';
import 'package:online_shop/widgets/cache_image.dart';
import 'package:online_shop/widgets/category_item_widget.dart';




ListView generateCategoryItems(List<CategoryModel> category) {
    return ListView.builder(
      reverse: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: category.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        String categoryColor = 'ff${category[index].color}';
        int hexColor = int.parse(categoryColor, radix: 16);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CategoryItem(
            text: category[index].title,
            color: Color(hexColor),
            textStyle: const ['SM', 13, Colors.black, FontWeight.w500],
            child: Center(
                child: SizedBox(
              width: 24,
              height: 24,
              child: Center(
                  child: CacheImage(
                imageUrl: Helper.getFilePath(
                    collectionId: category[index].collectionId,
                    recordId: category[index].id,
                    filename: category[index].icon),
              )),
            )),
          ),
        );
      },
    );
  }