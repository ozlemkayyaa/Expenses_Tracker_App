import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/constants/collections.dart';
import 'package:expense_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Create User
  @override
  Future<void> createUser(UserModel userModel) async {
    final CollectionReference users =
        _firebaseFirestore.collection(Collections.users);
    userModel.userId = _firebaseAuth.currentUser!.uid;

    final userEntityMap = userModel.toEntity().toDocument();

    await users.doc(userModel.userId).set(userEntityMap);
  }

  // Delete User
  @override
  Future<void> deleteUser(UserModel userModel) async {
    final CollectionReference users =
        _firebaseFirestore.collection(Collections.users);
    userModel.userId = _firebaseAuth.currentUser!.uid;
    await users.doc(userModel.userId).delete();
  }

  // Read User
  @override
  Future<UserModel> fetchUser(UserModel userModel) async {
    final CollectionReference users =
        _firebaseFirestore.collection(Collections.users);
    userModel.userId = _firebaseAuth.currentUser!.uid;
    final DocumentSnapshot documentSnapshot =
        await users.doc(userModel.userId).get();
    if (documentSnapshot.exists) {
      return UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Kullanıcı Yok!");
    }
  }

  // Update User
  @override
  Future<void> updateUser(UserModel userModel) async {
    final CollectionReference users =
        _firebaseFirestore.collection(Collections.users);
    userModel.userId = _firebaseAuth.currentUser!.uid;

    final userEntityMap = userModel.toEntity().toDocument();

    await users.doc(userModel.userId).update(userEntityMap);
  }
}
