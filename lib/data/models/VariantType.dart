import 'package:online_shop/enums/VariantType.dart';

class VariantType {
  String id;
  String name;
  String title;
  VariantTypeEnum type;
  VariantType({
    required this.id,
    required this.name,
    required this.title,
    required this.type,
  });

  factory VariantType.fromMapJson(Map<String, dynamic> JsonMapObject) {
    return VariantType(
      id: JsonMapObject['id'] as String,
      name: JsonMapObject['name'] as String,
      title: JsonMapObject['title'] as String,
      type: getTypeVariant(JsonMapObject['type']),
    );
  }
}
