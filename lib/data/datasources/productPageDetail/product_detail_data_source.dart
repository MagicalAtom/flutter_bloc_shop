import 'package:dio/dio.dart';
import 'package:flutter/src/foundation/annotations.dart';
import 'package:online_shop/config/data.dart';
import 'package:online_shop/data/datasources/productPageDetail/product_detail_data_source_impl.dart';
import 'package:online_shop/data/models/Category.dart';
import 'package:online_shop/data/models/ProductGallery.dart';
import 'package:online_shop/data/models/ProductVariant.dart';
import 'package:online_shop/data/models/Variant.dart';
import 'package:online_shop/data/models/VariantType.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/services/httpRequest/httpRequestimpl.dart';

class ProductDetail extends ProductDetailInterFace {
  final HttpRequestInterFace httpRequest = ServiceLocator.get();

  @override
  Future<List<ProductGallery>> getProductGallery(String product_id) async {
    Response response = await httpRequest.get(
        Data.ProductGalleryPath,
        httpRequest.setqueryParameters(
            filtername: 'product_id', filterValue: "$product_id"));
    List<ProductGallery> productGallery = [];
    if (response.statusCode == 200) {
      productGallery = response.data['items']
          .map<ProductGallery>(
              (jsonObject) => ProductGallery.fromMapJson(jsonObject))
          .toList();
      return productGallery;
    }
    return [];
  }

  @override
  Future<List<VariantType>> getVariantType() async {
    Response response = await httpRequest.get(Data.VariantTypePath);
    List<VariantType> VariantTypeProducts = [];

    if (response.statusCode == 200) {
      VariantTypeProducts = response.data['items']
          .map<VariantType>(
              (jsonMapObject) => VariantType.fromMapJson(jsonMapObject))
          .toList();
    }
    return VariantTypeProducts;
  }

  @override
  Future<List<Varaint>> getVariants(String product_id) async {
    Response response = await httpRequest.get(
        Data.VariantPath,
        httpRequest.setqueryParameters(
            filtername: 'product_id', filterValue: "$product_id"));

    List<Varaint> variantsList = [];

    if (response.statusCode == 200) {
      variantsList = response.data['items']
          .map<Varaint>((jsonMapObject) => Varaint.fromMapJson(jsonMapObject))
          .toList();
    }
    return variantsList;
  }

  @override
  Future<List<productVariant>> getPrductVariants(String product_id) async {
    var VariantType = await getVariantType();
    var VariantsListType = await getVariants(product_id);

    List<productVariant> ProductVariant = [];

    for (var variantType in VariantType) {
      // اینجا برای پیاده سازی و مرتبط کردن ورینت ها با تایپ ورینت هاست
      var VariantList = VariantsListType.where((element) =>
              element.typeId ==
              variantType
                  .id) // اینجا میگه هر وقت این دو تا با هم آیدی هاشون برابر بود . برای صحت سنجی ریلیشن هست ریخته بشه داخل متغیر
          .toList();

      ProductVariant.add(
          productVariant(variantType: variantType, varaint: VariantList));
    }

    return ProductVariant;
  }

  @override
  // return a 1 category
  Future<CategoryModel> getProductCategory(String category_id) async {
    Response response = await httpRequest.get(
        Data.CategoryPath,
        httpRequest.setqueryParameters(
            filtername: 'id', filterValue: category_id));

      return CategoryModel.fromMapJson(response.data['items'][0]);
  }
}
