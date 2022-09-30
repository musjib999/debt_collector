part of 'balance_bloc.dart';

abstract class BalanceEvent extends Equatable {
  const BalanceEvent();
}

class BalanceSuccessEvent extends BalanceEvent{
  final double totalDebt;
  const BalanceSuccessEvent({required this.totalDebt});

  @override
  List<Object> get props => [totalDebt];
}