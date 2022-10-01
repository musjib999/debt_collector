import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/debt_model.dart';

part 'debt_event.dart';
part 'debt_state.dart';

class DebtBloc extends Bloc<DebtEvent, DebtState> {
  DebtBloc() : super(DebtInitial()) {
    on<DebtEvent>((event, emit) {
      emit(DebtInitial());
    });

    on<DebtSuccessEvent>((event, emit){
      emit(DebtLoaded(debts: event.debts, status: DebtStatus.success));
    });

    on<AddDebtEvent>((event, emit){
      emit(DebtLoaded(debts: event.addedDebts, status: DebtStatus.added));
    });

    on<RemoveDebtEvent>((event, emit){
      emit(DebtLoaded(debts: event.newDebts, status: DebtStatus.removed));
    });

    on<EditDebtEvent>((event, emit){
      emit(DebtLoaded(debts: event.editedDebts, status: DebtStatus.edit));
    });
  }
}
