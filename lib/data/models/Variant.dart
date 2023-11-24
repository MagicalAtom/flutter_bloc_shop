class Varaint {

  /*
این کلاس و کلاس 
VariantType
به هم مرتبط هستند 
ورینت تایپ یعنی سردسته ورینت ها 
مثلا تو گوشی ها 
رنگ و حافظه داخلی هستش 
و این کلاس یعنی ورینت ها 
یعنی زیردسته ورینت تایپ ها
مثلا رنگ های قرمز و سبز و آبی
یا حافظه 246 یا 128
*/
  String id;
  String name;
  String typeId;
  String value;

  int priceChange;
  Varaint({
    required this.id,
    required this.name,
    required this.typeId,
    required this.value,
    required this.priceChange,
  });

  factory Varaint.fromMapJson(Map<String, dynamic> FromMapJson) {
    return Varaint(
      // بهتره هر جفتش هم کلید دسترسی به داده ها در فرام مپ جیسان هم فیلد های کلاس یک نام رو داشته باشن
      id: FromMapJson['id'] as String,
      name: FromMapJson['name'] as String,
      typeId: FromMapJson['type_id'] as String,
      value: FromMapJson['value'] as String,
      priceChange: FromMapJson['price_change'] as int,
    );
  }
}
