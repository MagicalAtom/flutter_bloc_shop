
class ProductGallery {
  String collectionId;
  String collectionName;
  String id;
  String image;
  String product_id;
  ProductGallery({
    required this.collectionId,
    required this.collectionName,
    required this.id,
    required this.image,
    required this.product_id,
  });

  factory ProductGallery.fromMapJson(Map<String, dynamic> fromMapJson) {
    return ProductGallery(
      collectionId: fromMapJson['collectionId'] as String,
      collectionName: fromMapJson['collectionName'] as String,
      id: fromMapJson['id'] as String,
      image: fromMapJson['image'] as String,
      product_id: fromMapJson['product_id'] as String,
    );
  }

}
