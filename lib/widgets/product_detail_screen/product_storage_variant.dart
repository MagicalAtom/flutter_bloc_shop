import 'package:flutter/material.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/data/models/ProductVariant.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';

class LocalStorage extends StatefulWidget {
  LocalStorage({
    super.key,
    required this.variantType,
  });
  List variantType;

  @override
  State<LocalStorage> createState() => _LocalStorageState();
}

class _LocalStorageState extends State<LocalStorage> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                height: 30,
                child: ListView.builder(
                  itemCount: widget.variantType.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedItem = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 74,
                        height: 26,
                         margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            border: selectedItem == index
                                ? Border.all(width: 3, color: Colors.black)
                                : Border.all(width: 1, color: ColorConfig.grey),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white),
                        child: Center(
                          child: CustomText(
                            text: widget.variantType[index].value,
                            fontFamily: 'SM',
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
