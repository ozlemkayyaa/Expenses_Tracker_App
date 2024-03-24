import 'package:expense_repository/auth_repository.dart';

class UserModel {
  String? userId;
  String? fullName;
  String? email;
  List<Expense>? expenses;
  List<Category>? categories;

  UserModel({
    this.userId,
    this.fullName,
    this.email,
    this.expenses,
    this.categories,
  });

  static final empty = UserModel(
    userId: '',
    fullName: '',
    email: '',
    expenses: [],
    categories: [],
  );

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      fullName: map['fullName'],
      email: map['email'],
      expenses: (map['expenses'] as List<dynamic>?)
          ?.map((e) => Expense.fromEntity(
              ExpenseEntity.fromDocument(e as Map<String, dynamic>)))
          .toList(),
      categories: (map['categories'] as List<dynamic>?)
          ?.map((c) => Category.formEntity(
              CategoryEntity.fromDocument(c as Map<String, dynamic>)))
          .toList(),
    );
  }
  UserEntity toEntity() {
    return UserEntity(
      expenses: expenses?.map((expense) => expense.toEntity()).toList(),
      categories: categories?.map((category) => category.toEntity()).toList(),
      userId: userId,
      fullName: fullName,
      email: email,
    );
  }

  static UserModel formEntity(UserEntity entity) {
    return UserModel(
      userId: entity.userId,
      fullName: entity.fullName,
      email: entity.email,
      expenses: (entity.expenses ?? [])
          .map((expense) => Expense.fromEntity(expense))
          .toList(),
      categories: (entity.categories ?? [])
          .map((category) => Category.formEntity(category))
          .toList(),
    );
  }
}
