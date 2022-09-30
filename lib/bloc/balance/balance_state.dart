part of 'balance_bloc.dart';

abstract class BalanceState extends Equatable {
  const BalanceState();
}

class BalanceInitial extends BalanceState {
  @override
  List<Object> get props => [];
}

class BalanceLoaded extends BalanceState {
  final double totalDebt;
  const BalanceLoaded({required this.totalDebt});

  @override
  List<Object> get props => [totalDebt];
}

