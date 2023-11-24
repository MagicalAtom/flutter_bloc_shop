import 'package:dartz/dartz.dart';
import 'package:online_shop/data/models/Banner.dart';

abstract class BannerRepositoryInterFace {
  Future<Either<String, List<BannerModel>>> getBanner();
}
