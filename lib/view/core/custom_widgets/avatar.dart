import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double height, width;
  final String url;
  final Color backColor;

  const Avatar(
      {super.key,
      this.height = 28,
      this.width = 28,
      required this.backColor,
      required this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backColor,
      ),
      child: ClipOval(child: Image.network(url, fit: BoxFit.cover)),
    );
  }
}
