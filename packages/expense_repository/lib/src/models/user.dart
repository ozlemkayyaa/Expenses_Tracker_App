import '../entities/entities.dart';

class User {
  String userId;
  String fullName;
  String email;

  User({
    required this.userId,
    required this.fullName,
    required this.email,
  });

  static final empty = User(
    userId: '',
    fullName: '',
    email: '',
  );

  UserEntity toEntity() {
    return UserEntity(
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
    );
  }
}
