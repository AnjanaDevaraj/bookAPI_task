import 'package:flutter/material.dart';

class CustomDateTimePicker extends StatefulWidget {
  final ValueChanged<DateTime>? onChanged;

  const CustomDateTimePicker({Key? key, this.onChanged}) : super(key: key);

  @override
  _CustomDateTimePickerState createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onChanged?.call(_selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey[200], // Background color
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () => _selectDate(context),
            ),
          ],
        ),
      ),
    );
  }
}
