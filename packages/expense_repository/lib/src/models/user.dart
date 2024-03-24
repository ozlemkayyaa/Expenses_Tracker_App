import 'package:expense_repository/auth_repository.dart';

class User {
  String? userId;
  String? fullName;
  String? email;
  List<Expense>? expenses;
  List<Category>? categories;

  User({
    this.userId,
    this.fullName,
    this.email,
    this.expenses,
    this.categories,
  });

  static final empty = User(
    userId: '',
    fullName: '',
    email: '',
    expenses: [],
    categories: [],
  );

  UserEntity toEntity() {
    return UserEntity(
      categories: categories,
      expenses: expenses,
      userId: userId,
      fullName: fullName,
      email: email,
    );
  }

  static User formEntity(UserEntity entity) {
    return User(
      userId: entity.userId,
      fullName: entity.fullName,
      email: entity.email,
      expenses: entity.expenses,
      categories: entity.categories,
    );
  }
}
