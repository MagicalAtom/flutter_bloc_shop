import 'package:dio/dio.dart';
import 'package:online_shop/config/data.dart';
import 'package:online_shop/data/datasources/banner/banner_data_source_impl.dart';
import 'package:online_shop/data/models/Banner.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/services/httpRequest/httpRequestimpl.dart';

class HomeBannerSlider implements HomeBannerSliderInterFace {
  final HttpRequestInterFace httpRequest = ServiceLocator.get();
  @override
  Future<List<BannerModel>> getBanner() async {
    Response response = await httpRequest.get(Data.BannerPath);

    List<BannerModel> banners = [];

    if (response.statusCode == 200) {
      banners = response.data['items']
          .map<BannerModel>(
              (categoryItems) => BannerModel.fromMapJson(categoryItems))
          .toList();
      return banners;
    }
    return [];
  }
}
