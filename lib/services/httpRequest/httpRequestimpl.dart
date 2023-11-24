abstract class HttpRequestInterFace {



Future<dynamic> post(String path,Map<String,dynamic> data);
Future<dynamic> get(String path,[queryParameters]);
Map<String,String> setqueryParameters({filtername,filterValue});




}