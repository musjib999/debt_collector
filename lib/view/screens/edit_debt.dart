import 'package:debt_collector/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/debt/debt_bloc.dart';
import '../../core/core.dart';

class EditDebt extends StatefulWidget {
  final DebtModel debt;

  const EditDebt({Key? key, required this.debt}) : super(key: key);

  @override
  State<EditDebt> createState() => _EditDebtState();
}

class _EditDebtState extends State<EditDebt> {
  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit'),),
      body: BlocListener<DebtBloc, DebtState>(
        listener: (context, state) {
          if(state is DebtLoaded){
            if(state.status == DebtStatus.edit){
              si.dialogService.showSuccessSnackBar(
                  context: context, message: 'Debt Edited successfully');
              name.clear();
              amount.clear();
              si.routerService.popRoute(context);
            }
          }
        },
        child: Container(
          margin: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
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
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 100.w,
                  height: 6.5.h,
                  child: ElevatedButton(
                    child: const Text('Edit'),
                    onPressed: () {
                      si.debtService.editDebt(
                        debt: widget.debt,
                        name: name.text == '' ? widget.debt.debtor : name.text,
                        amount: amount.text == '' ? widget.debt.amount : double
                            .parse(amount.text),
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
