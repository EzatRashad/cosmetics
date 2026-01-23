import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.boxFit,
  });
  final String image;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image(
      loadingBuilder: (context, child, loadingProgress) =>
          loadingProgress == null ? child : Container(color: Colors.grey[300]),
      image: NetworkImage(image),
      fit: boxFit ?? BoxFit.cover,
      width:width?? 30,
      height:height?? 30,
    );
  }
}
