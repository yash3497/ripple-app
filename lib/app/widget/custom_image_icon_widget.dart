import 'package:flutter/material.dart';

class ImageIconCustom extends StatelessWidget {
  const ImageIconCustom({
    super.key,
    required this.iconName,
    this.color = Colors.black,
    this.size,
  });
  final Color? color;
  final double? size;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage("assets/icons/$iconName"),
      color: color,
      size: size,
    );
  }
}
