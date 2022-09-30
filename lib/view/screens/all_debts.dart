import 'package:debt_collector/bloc/balance/balance_bloc.dart';
import 'package:debt_collector/bloc/debt/debt_bloc.dart';
import 'package:debt_collector/index.dart';
import 'package:debt_collector/view/screens/single_debt.dart';
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
                if (state is BalanceLoaded) {
                  return Expanded(
                    flex: 1,
                    child: DebtCard(
                      totalDebt: state.totalDebt,
                    ),
                  );
                }
                return const Expanded(
                  flex: 1,
                  child: DebtCard(
                    totalDebt: 0.0,
                  ),
                );
              },
            ),
            Expanded(
              flex: 3,
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
                            return Card(
                              elevation: 2,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 4.sp, vertical: 6.5.sp),
                              child: ListTile(
                                onTap: () {
                                  si.routerService.nextRoute(
                                    context,
                                    SingleDebt(
                                      debt: state.debts[index],
                                    ),
                                  );
                                },
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      state.debts[index].debtor,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(height: 8.sp),
                                    Text(
                                      state.debts[index].item,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                trailing: Column(
                                  children: [
                                    Text(
                                      '₦${si.utilityService.numberFormatter(state.debts[index].amount)}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(height: 8.sp),
                                    Text(
                                      '${state.debts[index].date.day}/${state.debts[index].date.month}/${state.debts[index].date.year}',
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
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
