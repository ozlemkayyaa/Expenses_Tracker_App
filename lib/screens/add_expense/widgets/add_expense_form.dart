import 'package:expenses_tracker/screens/add_expense/widgets/create_category.dart';
import 'package:expenses_tracker/screens/add_expense/widgets/save_button.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    dateController.text = DateFormat(ETexts.dateFormat).format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              labelText: ETexts.expense,
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
              prefixIcon: const Icon(Icons.list),
              suffixIcon: CreateCategory(),
              labelText: ETexts.category,
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
                initialDate: selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (newDate != null) {
                dateController.text =
                    DateFormat(ETexts.dateFormat).format(newDate);
                selectedDate = newDate;
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
          onPressed: () {},
        ),
      ],
    );
  }
}
