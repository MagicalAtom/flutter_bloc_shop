import 'package:flutter/material.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/data/models/ProductVariant.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';

class ColorsVariant extends StatefulWidget {
  ColorsVariant({
    super.key,
    required this.variant,
  });

  List variant;

  @override
  State<ColorsVariant> createState() => _ColorsVariantState();
}

class _ColorsVariantState extends State<ColorsVariant> {
  var clickItem;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 18,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: CustomText(
                text: 'انتخاب رنگ',
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
                reverse: true,
                itemCount: widget.variant.length,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  String categoryColor = 'ff${widget.variant[index].value}';
                  int hexColor = int.parse(categoryColor, radix: 16);
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        clickItem = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      margin: const EdgeInsets.only(left: 10),
                      width: clickItem == index ? 60 : 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Color(hexColor),
                          border: Border.all(color: ColorConfig.grey, width: 1),
                          borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: clickItem == index ?  CustomText(
                text: widget.variant[index].name,
                fontFamily: 'SM',
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ) : null,
                          ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
