
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'balance_event.dart';
part 'balance_state.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  BalanceBloc() : super(BalanceInitial()) {
    on<BalanceEvent>((event, emit) {
      emit(BalanceInitial());
    });

    on<BalanceSuccessEvent>((event, emit){
      emit(BalanceLoaded(totalDebt: event.totalDebt));
    });
  }
}
