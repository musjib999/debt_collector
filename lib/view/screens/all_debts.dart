import 'package:debt_collector/bloc/debt/debt_bloc.dart';
import 'package:debt_collector/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Debts'),
      ),
      body: BlocBuilder<DebtBloc, DebtState>(builder: (context, state) {
        if (state is DebtLoaded) {
          return state.debts.isEmpty
              ? const Center(
                  child: Text(
                    'No Debt',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          si.routerService.nextRoute(context, const AddDebt());
        },
      ),
    );
  }
}
