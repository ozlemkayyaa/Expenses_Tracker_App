import 'package:expenses_tracker/bloc/get_categories_bloc/get_categories_bloc.dart';
import 'package:expenses_tracker/screens/add_expense/widgets/add_expense_form.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TextField dışında bir yere bastığımda hem imleç gider hem de klavye
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
          builder: (context, state) {
            if (state is GetCategoriesSuccess) {
              return const Padding(
                padding: EdgeInsets.all(ESizes.lg),
                child: AddExpenseForm(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
