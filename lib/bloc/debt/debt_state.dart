part of 'debt_bloc.dart';

enum DebtStatus { success, added, removed, edit }

abstract class DebtState extends Equatable {
  const DebtState();
}

class DebtInitial extends DebtState {
  @override
  List<Object> get props => [];
}

class DebtLoaded extends DebtState {
  final DebtStatus status;
  final List<DebtModel> debts;
  const DebtLoaded({required this.debts, required this.status});

  @override
  List<Object> get props => [debts, status];
}


