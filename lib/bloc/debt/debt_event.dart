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

class AddDebtEvent extends DebtEvent{
  final List<DebtModel> addedDebts;
  const AddDebtEvent({required this.addedDebts});

  @override
  List<Object> get props => [addedDebts];
}

class RemoveDebtEvent extends DebtEvent{
  final List<DebtModel> newDebts;
  const RemoveDebtEvent({required this.newDebts});

  @override
  List<Object> get props => [newDebts];
}

class EditDebtEvent extends DebtEvent{
  final List<DebtModel> editedDebts;
  const EditDebtEvent({required this.editedDebts});

  @override
  List<Object> get props => [editedDebts];
}