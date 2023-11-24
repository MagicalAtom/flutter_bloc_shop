class BannerModel {
  String categoryId;
  String collectionId;
  String id;
  String thumbnail;



  BannerModel({
    required this.categoryId,
    required this.collectionId,
    required this.id,
    required this.thumbnail,
  });


  factory BannerModel.fromMapJson(Map<String, dynamic> map) {
    return BannerModel(
      categoryId: map['categoryId'] as String,
      collectionId: map['collectionId'] as String,
      id: map['id'] as String,
      thumbnail: map['thumbnail'] as String,
    );
  }


}
