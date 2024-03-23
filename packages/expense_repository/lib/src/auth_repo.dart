abstract class AuthRepository {
  // Kullanıcı kaydı
  Future<void> register(String fullName, String email, String password);

  // Kullanıcı girişi
  Future<void> signIn(String email, String password);

  // Kullanıcı çıkışı
  Future<void> signOut();

  // Şifre sıfırlama
  Future<void> resetPassword(String email);
}
