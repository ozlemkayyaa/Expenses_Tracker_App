import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/constants/collections.dart';
import 'package:expense_repository/expense_repository.dart';

class FirebaseExpenseRepo implements ExpenseRepository {
  final categoryCollection =
      FirebaseFirestore.instance.collection(Collections.categories);
  final expenseCollection =
      FirebaseFirestore.instance.collection(Collections.expenses);

  /*
  Yeni bir kategori oluşturmayı sağlayan fonksiyon. Kategorinin Firestore veritabanına eklenmesi işlemini gerçekleştirir.
  categoryCollection üzerinden kategori belgesi oluşturulur ve 
  bu belge, kategori nesnesinin toEntity() metoduyla dönüştürülen Entity'e, 
  daha sonra da toDocument() metoduyla dönüştürülen belgeye ayarlanır.
  set() metodu kullanılarak Firestore'a yeni belge eklenir. 
  Bu işlem sırasında hata oluşursa, log() ile hata mesajı kaydedilir ve hata yeniden atılır (rethrow).
  */

  @override
  Future<void> createCategory(Category category) async {
    try {
      await categoryCollection
          .doc(category.categoryId)
          .set(category.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  /*  
  Firestore'dan tüm kategorilerin alınmasını sağlayan fonksiyon. categoryCollection üzerinden tüm kategorilerin belgeleri getirilir.
  Ardından, bu belgelerin içinden bir dizi kategori oluşturulur.
  get() metodu asenkron olarak çalıştığı için, then() metodu kullanılarak belgelerin listesi alınır ve map() ile her bir belge,
  CategoryEntity.fromDocument() ve sonrasında Category.formEntity() metotları kullanılarak kategori nesnesine dönüştürülür.
  Son olarak, bu dönüştürülmüş kategori nesneleri bir listeye dönüştürülür ve döndürülür.
  Herhangi bir hata durumunda, log() ile hata mesajı kaydedilir ve hata yeniden atılır (rethrow).
  */

  @override
  Future<List<Category>> getCategory() async {
    try {
      return await categoryCollection.get().then((value) => value.docs
          .map(
              (e) => Category.formEntity(CategoryEntity.fromDocument(e.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  /*
  Yeni bir gider oluşturmayı sağlayan fonksiyon. Giderin Firestore veritabanına eklenmesi işlemini gerçekleştirir.
  expenseCollection üzerinden gider belgesi oluşturulur ve 
  bu belge, gider nesnesinin toEntity() metoduyla dönüştürülen Entity'e, 
  daha sonra da toDocument() metoduyla dönüştürülen belgeye ayarlanır.
  set() metodu kullanılarak Firestore'a yeni belge eklenir. 
  Bu işlem sırasında hata oluşursa, log() ile hata mesajı kaydedilir ve hata yeniden atılır (rethrow).
  */
  @override
  Future<void> createExpense(Expense expense) async {
    try {
      await expenseCollection
          .doc(expense.expenseId)
          .set(expense.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  /*
  Firestore'dan tüm giderlerin alınmasını sağlayan fonksiyon. expenseCollection üzerinden tüm giderlerin belgeleri getirilir.
  Ardından, bu belgelerin içinden bir dizi gider oluşturulur.
  get() metodu asenkron olarak çalıştığı için, then() metodu kullanılarak belgelerin listesi alınır ve map() ile her bir belge,
  ExpenseEntity.fromDocument() ve sonrasında Expense.fromEntity() metotları kullanılarak gider nesnesine dönüştürülür.
  Son olarak, bu dönüştürülmüş gider nesneleri bir listeye dönüştürülür ve döndürülür.
  Herhangi bir hata durumunda, log() ile hata mesajı kaydedilir ve hata yeniden atılır (rethrow).
  */
  @override
  Future<List<Expense>> getExpenses() async {
    try {
      return await expenseCollection.get().then((value) => value.docs
          .map((e) => Expense.fromEntity(ExpenseEntity.fromDocument(e.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  /*
  @override
  Future<List<Expense>> getUserExpenses(String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await expenseCollection.where('userId', isEqualTo: userId).get();
      return snapshot.docs
          .map((doc) =>
              Expense.fromEntity(ExpenseEntity.fromDocument(doc.data())))
          .toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  */
}
