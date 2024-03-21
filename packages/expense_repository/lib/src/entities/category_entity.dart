class CategoryEntity {
  String categoryId;
  String name;
  int totalExpenses;
  String icon;
  int color;

  CategoryEntity({
    required this.categoryId,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.color,
  });

  /// Bu fonksiyon, [CategoryEntity] nesnesini Firestore veritabanına kaydetmek için gerekli olan bir belgeye dönüştürür.
  /// Firestore'da belge veri yapısı kullanıldığı için, bu fonksiyon, [CategoryEntity] nesnesini Firestore belgesine dönüştürmek için kullanılır.
  Map<String, Object> toDocument() {
    return {
      'category_id': categoryId,
      'name': name,
      'totalExpenses': totalExpenses,
      'icon': icon,
      'color': color
    };
  }

  /// Bu fonksiyon, Firestore'dan alınan bir belgeyi [CategoryEntity] nesnesine dönüştürür.
  /// Firestore'dan alınan belgeler genellikle bir [Map<String, dynamic>] şeklinde gelir.
  /// Bu fonksiyon, bu belgeyi alır ve [CategoryEntity] nesnesine dönüştürmek için kullanılır.
  static CategoryEntity fromDocument(Map<String, dynamic> doc) {
    return CategoryEntity(
        categoryId: doc['category_id'],
        name: doc['name'],
        totalExpenses: doc['totalExpenses'],
        icon: doc['icon'],
        color: doc['color']);
  }
}
