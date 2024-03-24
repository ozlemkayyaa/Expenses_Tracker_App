import '../entities/entities.dart';

class Category {
  String categoryId;
  String name;
  int totalExpenses;
  String icon;
  int color;

  Category({
    required this.categoryId,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.color,
  });

  static final empty = Category(
    categoryId: '',
    name: '',
    totalExpenses: 0,
    icon: '',
    color: 0,
  );

  Map<String, dynamic> toDocument() {
    return {
      'categoryId': categoryId,
      'name': name,
      'totalExpenses': totalExpenses,
      'icon': icon,
      'color': color,
    };
  }

  static Category fromDocument(Map<String, dynamic> doc) {
    return Category(
      categoryId: doc['categoryId'],
      name: doc['name'],
      totalExpenses: doc['totalExpenses'],
      icon: doc['icon'],
      color: doc['color'],
    );
  }

  /// Bu fonksiyon, [Category] sınıfını Firestore'a veya başka bir veritabanına kaydetmek için gereken [CategoryEntity] sınıfına dönüştürür.
  /// Dönüştürülen [CategoryEntity] sınıfı, Firestore belgelerine veya diğer veritabanı yapılarına doğrudan yazılabilir.
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpenses: totalExpenses,
      icon: icon,
      color: color,
    );
  }

  /// Bu fonksiyon, Firestore veya başka bir veritabanından alınan bir [CategoryEntity] sınıfını [Category] sınıfına dönüştürür.
  /// Bu, veritabanından alınan veriyi uygulama içinde kullanılabilir bir forma dönüştürmek için kullanılır.
  static Category formEntity(CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      totalExpenses: entity.totalExpenses,
      icon: entity.icon,
      color: entity.color,
    );
  }
}
