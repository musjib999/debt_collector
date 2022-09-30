import 'package:debt_collector/bloc/balance/balance_bloc.dart';
import 'package:debt_collector/bloc/debt/debt_bloc.dart';
import 'package:debt_collector/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class AllDebts extends StatefulWidget {
  const AllDebts({Key? key}) : super(key: key);

  @override
  State<AllDebts> createState() => _AllDebtsState();
}

class _AllDebtsState extends State<AllDebts> {
  @override
  void initState() {
    super.initState();
    si.debtService.getAllDebts(context: context);
    si.debtService.getTotalDebt(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Debts'),
      ),
      body: Container(
        margin: EdgeInsets.all(6.sp),
        child: Column(
          children: [
            BlocBuilder<BalanceBloc, BalanceState>(
              builder: (context, state) {
                if(state is BalanceLoaded) {
                  return SizedBox(
                    height: 20.h,
                    width: 100.w,
                    child: DebtCard(totalDebt: state.totalDebt,),
                  );
                }
                return SizedBox(
                  height: 20.h,
                  width: 100.w,
                  child: const DebtCard(totalDebt: 0.0,),
                );
              },
            ),
            SizedBox(
              height: 65.h,
              child:
              BlocBuilder<DebtBloc, DebtState>(builder: (context, state) {
                if (state is DebtLoaded) {
                  return state.debts.isEmpty
                      ? const Center(
                    child: Text(
                      'No Debt',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  )
                      : ListView.builder(
                    itemCount: state.debts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.debts[index].debtor),
                        trailing: Text('N${state.debts[index].amount}'),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          si.routerService.nextRoute(context, const AddDebt());
        },
      ),
    );
  }
}

