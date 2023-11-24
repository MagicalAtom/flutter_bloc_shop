import 'package:dartz/dartz.dart';
import 'package:online_shop/data/datasources/banner/banner_data_source_impl.dart';
import 'package:online_shop/data/models/Banner.dart';
import 'package:online_shop/data/repositories/banner/banner_repository_impl.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/exception/HttpException.dart';

class BannerRepository implements BannerRepositoryInterFace {
  final HomeBannerSliderInterFace homeBannerSlider = ServiceLocator.get();
  @override
  Future<Either<String, List<BannerModel>>> getBanner() async {
    try {
      List<BannerModel> banners = await homeBannerSlider.getBanner();
      return right(banners);
    } on HttpExceptionHandle catch (e) {
      return left(e.message ?? 'خطا');
    }
  }
}
