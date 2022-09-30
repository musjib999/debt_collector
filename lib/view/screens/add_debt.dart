import 'package:debt_collector/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/debt/debt_bloc.dart';

class AddDebt extends StatefulWidget {
  const AddDebt({Key? key}) : super(key: key);

  @override
  State<AddDebt> createState() => _AddDebtState();
}

class _AddDebtState extends State<AddDebt> {
  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController item = TextEditingController();
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Debt'),
      ),
      body: BlocListener<DebtBloc, DebtState>(
        listener: (context, state) {
          if (state is DebtLoaded) {
            si.dialogService.showSuccessSnackBar(
                context: context, message: 'Debt Added successfully');
            name.clear();
            amount.clear();
            item.clear();
            selectedDate = null;
          }
        },
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      hintText: 'Debtor',
                      border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: amount,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.attach_money_outlined),
                    hintText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12.0),
                GestureDetector(
                  onTap: () {
                    si.utilityService.selectDate(context).then((value) {
                      setState(() {
                        selectedDate = value;
                      });
                    });
                  },
                  child: DatePickerForm(
                    hintText: selectedDate == null
                        ? 'Date'
                        : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                  ),
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: item,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.card_travel),
                    hintText: 'item',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 100.w,
                  height: 6.5.h,
                  child: ElevatedButton(
                    child: const Text('Add'),
                    onPressed: () {
                      si.debtService.addDebt(
                        name: name.text,
                        amount: double.parse(amount.text),
                        date: selectedDate!,
                        item: item.text,
                        context: context,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
