import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<Color> getDominantColorFromImageUrl(String imageUrl) async {
  final PaletteGenerator paletteGenerator =
      await PaletteGenerator.fromImageProvider(
    NetworkImage(imageUrl),
  );
  return paletteGenerator.dominantColor?.color ?? Colors.white;
}

Color calculateContrastColor(Color backgroundColor) {
  final double threshold = 128; // Ngưỡng giá trị để xác định màu chữ tương phản

  // Tính toán giá trị độ sáng của màu nền
  final double backgroundBrightness = backgroundColor.computeLuminance();

  // Xác định màu chữ dựa trên giá trị độ sáng của màu nền
  return backgroundBrightness < threshold ? Colors.white : Colors.black;
}

enum StatusCode {
  successGET,
  successPOST,
  unauthorized,
  notFound,
  internalServerError,
  // Thêm các mã trạng thái HTTP khác tại đây nếu cần
}

// Hàm để chuyển mã trạng thái HTTP thành mã mã trạng thái enum tương ứng
StatusCode? parseStatusCode(int statusCode) {
  switch (statusCode) {
    case 200:
      return StatusCode.successGET;
    case 201:
      return StatusCode.successPOST;
    case 401:
      return StatusCode.unauthorized;
    case 404:
      return StatusCode.notFound;
    case 500:
      return StatusCode.internalServerError;
    // Thêm các trường hợp khác nếu cần
    default:
      return null;
  }
}

class StatusMessage {
  bool isSuccess = false;
  String message = "Successfully";

  StatusMessage(this.isSuccess, this.message);
}
