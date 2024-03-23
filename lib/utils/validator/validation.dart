import 'package:expenses_tracker/utils/constants/texts.dart';

class EValidator {
  // Ad/Soayad doğrulaması yapan fonksiyon
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return ETexts.validation;
    }
    return null; // Geçerli durumda null döndür
  }

  // E-posta doğrulaması yapan fonksiyon
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return ETexts.validationEmail;
    }
    return null; // Geçerli durumda null döndür
  }

  // Şifre doğrulaması yapan fonksiyon
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return ETexts.validatePassword;
    }

    // Şifre uzunluğunu kontrol et
    if (value.length < 8) {
      return ETexts.validatePassword2;
    }
    return null;
  }
}
