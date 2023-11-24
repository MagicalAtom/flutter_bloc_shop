import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/config/data.dart';
import 'package:online_shop/data/models/Banner.dart';
import 'package:online_shop/helper/helper.dart';
import 'package:online_shop/widgets/cache_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWidget extends StatefulWidget {
  SliderWidget(
      {super.key,
      required this.children,
      required this.duration,
      required this.curve});

  /// Any array that is placed inside the children. Its houses are opened bit by bit and placed inside the slider houses. Inside this project, because the slider only accepts photos, it is better to place the path of the photos inside it
  List<BannerModel> children;

  Duration duration;

  Curve curve;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int current_page = 0;
  Timer? timer;
  PageController controller = PageController(
    viewportFraction: 0.9,
    initialPage: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(widget.duration, (timer) {
      if (current_page < widget.children.length - 1) {
        setState(() {
          current_page = current_page + 1;
        });
      } else {
        setState(() {
          current_page = 0;
        });
      }
      controller.animateToPage(current_page,
          duration: Duration(milliseconds: 400), curve: widget.curve);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          // سایزد باکس برای این به کار رفت اینجا تا جلوی کش آمدن آیتم های اسلایدر را تا پایین صفحه به دلیل اینکه استک کل بدنه است بگیرد و در اصل سایز اسلایدر را محدود کند
          height: 170,
          child: PageView.builder(
            itemCount: widget.children.length,
            controller: controller,
            itemBuilder: (context, index) {
              return Container(
                  padding: index == 0
                      ? const EdgeInsets.only(right: 13)
                      : const EdgeInsets.only(right: 13, left: 13),
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: CacheImage(
                        imageUrl: Helper.getFilePath(
                      collectionId: widget.children[index].collectionId,
                      recordId: widget.children[index].id,
                      filename: widget.children[index].thumbnail,
                    )),
                  ));
            },
          ),
        ),
        Positioned(
          // ثابت چون بیرون از پیج ویو و درون استک با پوزیشن تعریف شده
          bottom: 10,
          child: SmoothPageIndicator(
            controller: controller,
            count: widget.children.length,
            effect: const ExpandingDotsEffect(
              expansionFactor: 4,
              dotHeight: 13,
              dotWidth: 13,
              dotColor: Colors.white,
              radius: 20,
              activeDotColor: ColorConfig.main,
            ),
          ),
        )
      ],
    );
  }
}
