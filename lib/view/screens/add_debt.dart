import 'package:debt_collector/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  bool hasPaid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Debt'),
      ),
      body: BlocListener<DebtBloc, DebtState>(
        listener: (context, state) {
          if(state is DebtLoaded){
            si.dialogService.showSuccessSnackBar(context: context, message: 'Debt Added successfully');
            name.clear();
            amount.clear();
            item.clear();
            hasPaid = false;
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
                      border: OutlineInputBorder()),
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
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month),
                    hintText: 'Date',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade500,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Paid',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.5,
                            color: Colors.grey.shade700),
                      ),
                      Checkbox(
                          value: hasPaid,
                          onChanged: (value) {
                            setState(() {
                              hasPaid = value!;
                            });
                          }),
                    ],
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
                PrimaryButton(
                  title: 'Add',
                  onTap: (startLoading, stopLoading, btnState) {
                    startLoading();
                    si.debtService.addDebt(
                        name: name.text,
                        amount: double.parse(amount.text),
                        date: DateTime.now(),
                        paid: hasPaid,
                        item: 'Money',
                        context: context);
                    stopLoading();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
