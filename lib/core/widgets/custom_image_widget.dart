import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String imageName;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;

  const AppImage({
    super.key,
    required this.imageName,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
  });

  bool get isSvg => imageName.toLowerCase().endsWith('.svg');

  String get imagePath {
    if (isSvg) {
      return 'assets/icons/$imageName';
    } else {
      return 'assets/images/$imageName';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isSvg) {
      return SvgPicture.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
      );
    } else {
      return Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit,
        color: color,
      );
    }
  }
}
