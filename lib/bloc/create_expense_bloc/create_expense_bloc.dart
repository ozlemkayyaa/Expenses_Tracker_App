import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_expense_event.dart';
part 'create_expense_state.dart';

class CreateExpenseBloc extends Bloc<CreateExpenseEvent, CreateExpenseState> {
  CreateExpenseBloc() : super(CreateExpenseInitial()) {
    on<CreateExpenseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
