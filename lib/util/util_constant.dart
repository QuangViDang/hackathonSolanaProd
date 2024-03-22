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

enum HttpStatus {
  success,
  unauthorized,
  notFound,
  internalServerError,
  // Thêm các mã trạng thái HTTP khác tại đây nếu cần
}

// Hàm để chuyển mã trạng thái HTTP thành mã mã trạng thái enum tương ứng
HttpStatus? parseHttpStatus(int statusCode) {
  switch (statusCode) {
    case 200:
      return HttpStatus.success;
    case 201:
      return HttpStatus.success;
    case 401:
      return HttpStatus.unauthorized;
    case 404:
      return HttpStatus.notFound;
    case 500:
      return HttpStatus.internalServerError;
    // Thêm các trường hợp khác nếu cần
    default:
      return null;
  }
}

class Status {
  bool isSuccess;
  String message = "Successfully";

  Status(this.isSuccess, this.message);
}
