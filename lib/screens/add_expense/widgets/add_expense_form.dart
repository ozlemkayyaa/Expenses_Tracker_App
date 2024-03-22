import 'package:expense_repository/expense_repository.dart';
import 'package:expenses_tracker/bloc/get_categories_bloc/get_categories_bloc.dart';
//import 'package:expenses_tracker/screens/add_expense/widgets/category_list_card.dart';
import 'package:expenses_tracker/screens/add_expense/widgets/create_category_widget.dart';
import 'package:expenses_tracker/screens/add_expense/widgets/save_button.dart';
import 'package:expenses_tracker/utils/constants/colors.dart';
//import 'package:expenses_tracker/utils/constants/colors.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:expenses_tracker/utils/helpers/helpers.dart';
//import 'package:expenses_tracker/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddExpenseForm extends StatefulWidget {
  const AddExpenseForm({
    super.key,
  });

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  final TextEditingController expenseController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  late Expense expense;

  @override
  void initState() {
    dateController.text = DateFormat(ETexts.dateFormat).format(DateTime.now());
    expense = Expense.empty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Add Expenses başlığı
          Text(ETexts.addExpenses,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: ESizes.lg),

          // Expense
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: TextFormField(
              controller: expenseController,
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                prefixIcon: Icon(CupertinoIcons.money_dollar),
                hintText: ETexts.expense,
              ),
            ),
          ),

          // Category
          const SizedBox(height: ESizes.lg),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: TextFormField(
              controller: categoryController,
              textAlignVertical: TextAlignVertical.center,
              readOnly: true,
              onTap: () {},
              decoration: InputDecoration(
                filled: true,
                fillColor: expense.category == Category.empty
                    ? dark
                        ? EColors.black
                        : Colors.white
                    : Color(expense.category.color),
                prefixIcon: expense.category == Category.empty
                    ? const Icon(Icons.list)
                    : Image.asset(
                        expense.category.icon,
                        scale: 2,
                      ),
                suffixIcon: const CreateCategoryWidget(),
                hintText: ETexts.category,
              ),
            ),
          ),

          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: dark ? EColors.black : Colors.white,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
                builder: (context, state) {
                  if (state is GetCategoriesSuccess) {
                    return ListView.builder(
                        itemCount: state.categories.length,
                        itemBuilder: (context, int i) {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  expense.category = state.categories[i];
                                  categoryController.text =
                                      expense.category.name;
                                });
                              },
                              leading: Image.asset(
                                state.categories[i].icon,
                                scale: 2,
                              ),
                              title: Text(state.categories[i].name),
                              tileColor: Color(state.categories[i].color),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),

          // Date
          const SizedBox(height: ESizes.lg),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: TextFormField(
              controller: dateController,
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: expense.date,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (newDate != null) {
                  dateController.text =
                      DateFormat(ETexts.dateFormat).format(newDate);
                  //selectedDate = newDate;
                  expense.date = newDate;
                }
              },
              readOnly: true, // klavye çıkmaz,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_month_outlined),
                labelText: ETexts.date,
              ),
            ),
          ),

          // Save
          const SizedBox(height: ESizes.xl),
          SaveButton(
            onPressed: () {
              setState(() {
                expense.amount = int.parse(expenseController.text);
              });
            },
          ),
        ],
      ),
    );
  }
}
