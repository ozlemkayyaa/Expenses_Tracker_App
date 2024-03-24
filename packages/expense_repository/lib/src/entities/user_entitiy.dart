import 'package:expense_repository/src/entities/entities.dart';

class UserEntity {
  String? userId;
  String? fullName;
  String? email;
  List<ExpenseEntity>? expenses;
  List<CategoryEntity>? categories;

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
      'categories':
          categories?.map((category) => category.toDocument()).toList(),
      'expenses': expenses?.map((expense) => expense.toDocument()).toList(),
    };
  }

  static UserEntity fromDocument(Map<String, dynamic> doc) {
    return UserEntity(
      userId: doc['userId'],
      fullName: doc['fullName'],
      email: doc['email'],
      categories: (doc['categories'] as List<dynamic>?)
          ?.map((category) => CategoryEntity.fromDocument(category))
          .toList(),
      expenses: (doc['expenses'] as List<dynamic>?)
          ?.map((expense) => ExpenseEntity.fromDocument(expense))
          .toList(),
    );
  }
}
