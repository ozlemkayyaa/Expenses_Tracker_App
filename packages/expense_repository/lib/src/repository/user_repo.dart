import '../models/models.dart';

abstract class UserRepository {
  // Create -> Ekleme
  Future<void> createUser(UserModel userModel);

  // Read -> Veri Getirme
  Future<void> fetchUser(UserModel userModel);

  // Update -> Güncelleme
  Future<void> updateUser(UserModel userModel);

  // Delete -> Silme
  Future<void> deleteUser(UserModel userModel);
}
