class UserEntity {
  String userId;
  String fullName;
  String email;

  UserEntity({
    required this.userId,
    required this.fullName,
    required this.email,
  });

  Map<String, Object> toDocument() {
    return {
      'userId': userId,
      'fullName': fullName,
      'email': email,
    };
  }

  static UserEntity fromDocument(Map<String, dynamic> doc) {
    return UserEntity(
      userId: doc['userId'],
      fullName: doc['fullName'],
      email: doc['email'],
    );
  }
}
