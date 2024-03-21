import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
     // width: 200,
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light grey background color
        borderRadius: BorderRadius.circular(8), // Border radius of 8
        border: Border.all(
          color: Colors.black.withOpacity(0.2), // Light black border color
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none, // No additional border inside the container
          contentPadding: EdgeInsets.symmetric(horizontal: 12), // Padding for text input
        ),
      ),
    );
  }
}