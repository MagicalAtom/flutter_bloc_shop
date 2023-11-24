class CategoryModel {

String collectionId;
String id;
String thumbnail;
String title;
String icon;
String color;



  CategoryModel({
    required this.collectionId,
    required this.id,
    required this.thumbnail,
    required this.title,
    required this.icon,
    required this.color,
  });


  factory CategoryModel.fromMapJson(Map<String, dynamic> map) {
    return CategoryModel(
      collectionId: map['collectionId'] as String,
      id: map['id'] as String,
      thumbnail: map['thumbnail'] as String,
      title: map['title'] as String,
      icon: map['icon'] as String,
      color: map['color'] as String,
    );
  }


}
