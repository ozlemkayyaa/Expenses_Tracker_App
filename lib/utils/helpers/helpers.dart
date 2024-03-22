import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';

class EHelperFunctions {
// Ekranlar arasında gezinmeyi sağlayan fonksiyon
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

// Tema modunun dark mı yoksa light mı olduğunu kontrol eden fonksiyon
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static double calculateTotalExpense(List<Expense> expenses) {
    double totalExpense = 0;
    for (var expense in expenses) {
      totalExpense += expense.amount;
    }
    return totalExpense;
  }
}
