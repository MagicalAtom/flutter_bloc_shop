import 'package:flutter/material.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/data/models/ProductVariant.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';

class LocalStorage extends StatelessWidget {
  LocalStorage({
    super.key,
    required this.variantType,
  });
  productVariant variantType;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomText(
                  text: 'انتخاب حافظه داخلی',
                  fontFamily: 'SM',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 74,
                    height: 26,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: ColorConfig.grey.withOpacity(.7)),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Center(
                      child: CustomText(
                        text: '128',
                        fontFamily: 'SM',
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 74,
                    height: 26,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: ColorConfig.grey.withOpacity(.7)),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Center(
                      child: CustomText(
                        text: '256',
                        fontFamily: 'SM',
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 74,
                    height: 26,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: ColorConfig.grey.withOpacity(.7)),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Center(
                      child: CustomText(
                        text: '512',
                        fontFamily: 'SM',
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
