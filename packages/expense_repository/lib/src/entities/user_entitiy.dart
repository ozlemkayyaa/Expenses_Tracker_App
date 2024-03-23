class UserEntity {
  String? userId;
  String? fullName;
  String? email;

  UserEntity({
    this.userId,
    this.fullName,
    this.email,
  });

  Map<String, dynamic> toDocument() {
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
