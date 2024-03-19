import 'package:expense_repository/expense_repository.dart';

//ExpenseRepository, harcama kategorileriyle ilgili işlemleri yapmak için arayüz sağlar.
abstract class ExpenseRepository {
  // Yeni bir kategori oluşturmayı sağlayan metot.
  Future<void> createCategory(Category category);

  // Tüm kategorileri almayı sağlayan metot
  Future<List<Category>> getCategory();
}
