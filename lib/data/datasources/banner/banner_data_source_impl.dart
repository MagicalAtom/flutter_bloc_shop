import 'package:online_shop/data/models/Banner.dart';
abstract class HomeBannerSliderInterFace {
  Future<List<BannerModel>> getBanner();
}