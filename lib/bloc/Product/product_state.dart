part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

final class ProductInitial extends ProductState {}



final class ProductLoadingState extends ProductState {}



final class ProductRequestResponseState extends ProductState {
  /*
  تایپ استیت ها هم باید یکی باشه با تایپ ریپازیتوری چون در بلاک قراره از ریپازیتوری استفاده کنیم و موارد ریپازیتوری ریخته بشه داخل استیت ها
  */



  /*
نکته بعدی اینه که اگه یک استیت مربوط به یک صفحه میشه مشکلی نداره که چندین استیت مثل این یکی داخلش تعریف بشه 
بهتره مربوط به هم و برای یک سفحه باشن
  */
Either<String,List<ProductGallery>> productGallery;
Either<String,List<productVariant>> productVariantList;
ProductRequestResponseState({required this.productGallery,required this.productVariantList});




}