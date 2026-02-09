import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class AppImage extends StatelessWidget {
  final String imageName;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final Widget? placeholder;
  final Widget? errorWidget;

  const AppImage({
    super.key,
    required this.imageName,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    this.placeholder,
    this.errorWidget,
  });

  bool get isSvg => imageName.toLowerCase().endsWith('.svg');

  bool get isNetwork => imageName.startsWith('http');

  String get imagePath {
    if (isSvg) {
      return 'assets/icons/$imageName';
    } else {
      return 'assets/images/$imageName';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isNetwork && isSvg) {
      return SvgPicture.network(
        imageName,
        width: width,
        height: height,
        fit: fit,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        placeholderBuilder: (_) =>
            placeholder ?? const CircularProgressIndicator(),
      );
    }

    if (isNetwork) {
      return CachedNetworkImage(
        imageUrl: imageName,
        width: width,
        height: height,
        fit: fit,
        color: color,

        placeholder: (context, url) =>
            placeholder ??
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
              ),
            ),

        errorWidget: (context, url, error) => errorWidget ?? Icon(Icons.error),
      );
    }

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
    }

    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}
