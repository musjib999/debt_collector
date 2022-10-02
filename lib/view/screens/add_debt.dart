import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:debt_collector/index.dart';
import 'package:flutter/cupertino.dart';
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
            if (state.status == DebtStatus.added) {
              si.dialogService.showSuccessSnackBar(
                  context: context, message: 'Debt Added successfully');
              name.clear();
              amount.clear();
              item.clear();
              selectedDate = null;
            }
          }
        },
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  style: TextStyle(color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark ? AppColors.fairlyWhite : Colors.black),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: 'Debtor',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: amount,
                  style: TextStyle(color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark ? AppColors.fairlyWhite : Colors.black),
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
                    if(Platform.isIOS){
                        showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext builder) {
                              return Container(
                                height: MediaQuery.of(context).copyWith().size.height*0.25,
                                color: Colors.white,
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (value) {
                                    setState((){
                                      selectedDate = value;
                                    });
                                  },
                                  initialDateTime: DateTime.now(),
                                  minimumYear: 1999,
                                  maximumDate: DateTime.now(),
                                ),
                              );
                            }
                        );
                    }else {
                      si.utilityService.selectDate(context).then((value) {
                        setState(() {
                          selectedDate = value;
                        });
                      });
                    }
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
                  style: TextStyle(color: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark ? AppColors.fairlyWhite : Colors.black),
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


