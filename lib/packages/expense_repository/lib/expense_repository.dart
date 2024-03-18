// Bu dosya, birçok ilgili dosya ve sınıfı bir araya getirerek 'expense_repository' adında bir modül oluşturur.
// Bu modül, kodu daha modüler hale getirir ve organize eder, bakımı ve yönetimi kolaylaştırır.

// Dışa aktarılan dosyalar ve sınıflar, bu kütüphanenin kullanılabilir arayüzünü oluşturur.
// Bu, diğer kod parçalarının bu kütüphanedeki sınıflara ve fonksiyonlara erişebilmesini sağlar.

// Kodun modüler yapısı, yeniden kullanılabilirliği artırır ve kodun paylaşımını ve kullanımını kolaylaştırır.
// Bu, kodun genel sürdürülebilirliğini artırır ve değişiklikleri yapmayı kolaylaştırır.

library expense_repository;

export 'src/entities/entities.dart';
export 'src/models/models.dart';
export 'src/expense_repo.dart';
export 'src/firebase_expense_repo.dart';
