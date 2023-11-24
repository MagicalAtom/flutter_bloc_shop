import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:online_shop/config/color.dart';
import 'package:shimmer/shimmer.dart';

class CacheImage extends StatelessWidget {
  CacheImage({super.key, required this.imageUrl});
  String imageUrl;
  bool isIcon = false;
  @override
  Widget build(BuildContext context) {
    if(isIcon){
      ClipRRect(
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        width: 40,
        imageUrl: imageUrl,
        errorWidget: (context, url, error) {
          return Container(
            color: Colors.red,
          );
        },
        placeholder: (context, url) {
          return Text('داده ها در دسترس نیست');
        },
      ),
    );
    }else{
      return ClipRRect(
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        errorWidget: (context, url, error) {
          return Container(
            color: Colors.red,
          );
        },
        placeholder: (context, url) {
          return SizedBox(
            width: 200.0,
            height: 100.0,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: ColorConfig.white,
              child: Container()
            ),
          );
        },
      ),
    );
    }
    return Text('داده های برنامه در دسترس نیست . اتصال اینترنت خود را بررسی کرده یا چند لحظه دیگر مجدد تلاش فرمایید');
  }
}
