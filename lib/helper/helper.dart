import 'dart:io';

import 'package:online_shop/config/data.dart';

class Helper {
  /// only using PocketBase Service
  static String getFilePath(
      {required String collectionId,
      required String recordId,
      required String filename}) {
    return Data.Baseurl +
        "files" +
        Platform.pathSeparator +
        collectionId +
        Platform.pathSeparator +
        recordId +
        Platform.pathSeparator +
        filename;
  }


  static  discountPricePercent({required price,required realPrice}){
    return ((price - realPrice) / price) * 100;
  }

}
