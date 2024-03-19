import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_expenses_event.dart';
part 'get_expenses_state.dart';

class GetExpensesBloc extends Bloc<GetExpensesEvent, GetExpensesState> {
  GetExpensesBloc() : super(GetExpensesInitial()) {
    on<GetExpensesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
