import 'package:flutter/material.dart';

Color calculateContrastColor(Color backgroundColor) {
  final double threshold = 128; // Ngưỡng giá trị để xác định màu chữ tương phản

  // Tính toán giá trị độ sáng của màu nền
  final double backgroundBrightness = backgroundColor.computeLuminance();

  // Xác định màu chữ dựa trên giá trị độ sáng của màu nền
  return backgroundBrightness < threshold ? Colors.white : Colors.black;
}
