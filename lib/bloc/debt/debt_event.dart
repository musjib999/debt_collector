part of 'debt_bloc.dart';

abstract class DebtEvent extends Equatable {
  const DebtEvent();
}

class DebtSuccessEvent extends DebtEvent{
  final List<DebtModel> debts;
  const DebtSuccessEvent({required this.debts});

  @override
  List<Object> get props => [debts];
}