import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<Color> getDominantColorFromImageUrl(String imageUrl) async {
  final PaletteGenerator paletteGenerator =
      await PaletteGenerator.fromImageProvider(
    NetworkImage(imageUrl),
  );
  return paletteGenerator.dominantColor?.color ?? Colors.white;
}
