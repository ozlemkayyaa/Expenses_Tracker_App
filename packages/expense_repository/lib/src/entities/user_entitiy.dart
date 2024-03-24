import 'package:expense_repository/auth_repository.dart';

class UserEntity {
  String? userId;
  String? fullName;
  String? email;
  List<Expense>? expenses;
  List<Category>? categories;

  UserEntity({
    this.userId,
    this.fullName,
    this.email,
    this.expenses,
    this.categories,
  });

  Map<String, dynamic> toDocument() {
    return {
      'userId': userId,
      'fullName': fullName,
      'email': email,
      'categories': categories,
      'expenses': expenses
    };
  }

  static UserEntity fromDocument(Map<String, dynamic> doc) {
    return UserEntity(
      userId: doc['userId'],
      fullName: doc['fullName'],
      email: doc['email'],
      categories: doc['categories'] as List<Category>,
      expenses: doc['expenses'] as List<Expense>,
    );
  }
}
