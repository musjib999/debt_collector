part of 'debt_bloc.dart';

abstract class DebtState extends Equatable {
  const DebtState();
}

//Todo: Add status to state
// enum DebtStatus{ success, added, removed}

class DebtInitial extends DebtState {
  @override
  List<Object> get props => [];
}

class DebtLoaded extends DebtState {
  final List<DebtModel> debts;
  const DebtLoaded({required this.debts});

  @override
  List<Object> get props => [debts];
}


