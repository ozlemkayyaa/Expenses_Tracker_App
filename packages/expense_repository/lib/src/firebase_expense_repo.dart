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
}
