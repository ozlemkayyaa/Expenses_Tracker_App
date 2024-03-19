part of 'get_expenses_bloc.dart';

sealed class GetExpensesState extends Equatable {
  const GetExpensesState();
  
  @override
  List<Object> get props => [];
}

final class GetExpensesInitial extends GetExpensesState {}
