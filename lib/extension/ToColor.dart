import 'package:flutter/material.dart';

extension ToHexColor on String {
  ToColor() {
    String categoryColor = 'ff${this}';
    int hexColor = int.parse(categoryColor, radix: 16);
    return Color(hexColor);
  }
}
