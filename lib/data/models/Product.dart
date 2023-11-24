// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {

String id;
String collectionId;
String thumbnail;
String description;
int discount_price;
int price;
String popularity;
String name;
int quantity;


/// discount a real price in model
int? realPrice;

String category;
  Product({
    required this.id,
    required this.collectionId,
    required this.thumbnail,
    required this.description,
    required this.discount_price,
    required this.price,
    required this.popularity,
    required this.name,
    required this.quantity,
    required this.category,
    
  }){
    realPrice = price + -discount_price;
    
  }





  factory Product.fromMapJson(Map<String, dynamic> fromMapJson) {
    return Product(
      id: fromMapJson['id'] as String,
      collectionId: fromMapJson['collectionId'] as String,
      thumbnail: fromMapJson['thumbnail'] as String,
      description: fromMapJson['description'] as String,
      discount_price: fromMapJson['discount_price'] as int,
      price: fromMapJson['price'] as int,
      popularity: fromMapJson['popularity'] as String,
      name: fromMapJson['name'] as String,
      quantity: fromMapJson['quantity'] as int,
      category: fromMapJson['category'] as String,
    );
  }

}
