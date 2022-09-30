import 'package:debt_collector/bloc/balance/balance_bloc.dart';
import 'package:debt_collector/bloc/debt/debt_bloc.dart';
import 'package:debt_collector/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DebtService{
  Future<List<DebtModel>> getAllDebts({required BuildContext context})async{
    List<DebtModel> debts = [];
    final savedDebts = await localData.getListFromSharedPreference(key: 'debts');
    if(savedDebts == null){
      debts = [];
    }else{
      debts = savedDebts.map((e) => DebtModel.fromRawJson(e)).toList();
    }
    context.read<DebtBloc>().add(DebtSuccessEvent(debts: debts));
    return debts;
  }

  Future<DebtModel> addDebt({required BuildContext context, required String name, required double amount, required DateTime date, required String item, String? description})async{
    List<DebtModel> debts = [];
    DebtModel? addedDebt;
    final savedDebts = await localData.getListFromSharedPreference(key: 'debts');
    if(savedDebts == null){
      addedDebt = DebtModel(debtor: name, amount: amount, date: date, item: item, description: description ?? '');
      debts.add(addedDebt);
      await localData.addListToSharedPreference(key: 'debts', value: debts.map((e) => e.toRawJson()).toList());
    }else{
      debts = savedDebts.map((e) => DebtModel.fromRawJson(e)).toList();
      addedDebt = DebtModel(debtor: name, amount: amount, date: date, item: item, description: description ?? '');
      debts.add(addedDebt);
      await localData.addListToSharedPreference(key: 'debts', value: debts.map((e) => e.toRawJson()).toList());
    }
    context.read<DebtBloc>().add(DebtSuccessEvent(debts: debts));
    getTotalDebt(context: context);
    return addedDebt;
  }

  Future getTotalDebt({required BuildContext context})async{
    double total = 0.0;
    final savedDebts = await localData.getListFromSharedPreference(key: 'debts');
    if(savedDebts == null){
      total = 0.0;
    }else{
     List<DebtModel> debts = savedDebts.map((e) => DebtModel.fromRawJson(e)).toList();
     for(DebtModel debt in debts){
       total = total + debt.amount;
     }
    }
    context.read<BalanceBloc>().add(BalanceSuccessEvent(totalDebt: total));
    return total;
  }

  Future deleteDebt({required BuildContext context, required DebtModel debt})async{
    final savedDebts = await localData.getListFromSharedPreference(key: 'debts');
    if(savedDebts != null){
      savedDebts.remove(debt.toRawJson());
      await localData.addListToSharedPreference(key: 'debts', value: savedDebts);
      List<DebtModel> debts = savedDebts.map((e) => DebtModel.fromRawJson(e)).toList();
      context.read<DebtBloc>().add(DebtSuccessEvent(debts: debts));
      getTotalDebt(context: context);
    }
    return debt;
  }
}
