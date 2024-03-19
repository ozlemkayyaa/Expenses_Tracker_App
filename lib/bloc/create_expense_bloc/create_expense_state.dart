part of 'create_expense_bloc.dart';

sealed class CreateExpenseState extends Equatable {
  const CreateExpenseState();
  
  @override
  List<Object> get props => [];
}

final class CreateExpenseInitial extends CreateExpenseState {}
