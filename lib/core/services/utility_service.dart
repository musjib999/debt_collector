import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UtilityService {
  Future<DateTime?> selectDate(BuildContext context) async {
    DateTime? selectedDate;
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1960, 1),
          lastDate: DateTime.now());
      if (picked != null) {
        selectedDate = picked;
      }
    return selectedDate;
  }

  String numberFormatter(double number) {
    NumberFormat formatter = NumberFormat.currency(symbol: '');
    return formatter.format(number);
  }
}
