// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductProprty {



String id;
String title;
String value;



  ProductProprty({
    required this.id,
    required this.title,
    required this.value,
  });


  factory ProductProprty.fromMap(Map<String, dynamic> map) {
    return ProductProprty(
      id: map['id'] as String,
      title: map['title'] as String,
      value: map['value'] as String,
    );
  }
}
