import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;

  const CustomText({
    required this.text,
    this.color,
    this.size,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.black, // Default color is black if not provided
        fontSize: size ?? 16, // Default size is 16 if not provided
        fontWeight: weight ?? FontWeight.normal, // Default weight is normal if not provided
      ),
    );
  }
}
