import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DatePickerForm extends StatelessWidget {
  final String hintText;
  const DatePickerForm({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade500,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          Icon(
            Icons.calendar_month,
            color: Colors.grey.shade600,
          ),
          SizedBox(width: 10.sp),
          Text(
            hintText,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15.5,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}