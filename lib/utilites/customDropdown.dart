import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String? hintText;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?>? onChanged;

  const CustomDropdown({
    Key? key,
    this.hintText,
    required this.items,
    this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          isExpanded: true,
          hint: hintText != null ? Text(hintText!) : null,
          value: value,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
