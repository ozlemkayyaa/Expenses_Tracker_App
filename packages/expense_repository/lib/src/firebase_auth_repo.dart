import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/constants/collections.dart';
import 'package:expense_repository/constants/texts.dart';
import 'package:expense_repository/src/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Register
  @override
  Future<void> register(String fullName, String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firebaseFirestore
          .collection(Collections.users)
          .doc(userCredential.user!.uid)
          .set({
        'userId': userCredential.user!.uid,
        'fullName': fullName,
        'email': email,
      });
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print('${ETextsPackage.registerError} ${e.message}');
      rethrow;
    }
  }

  //Forgot Password
  @override
  Future<void> forgotPassword(String email) async {
    try {
      await _firebaseAuth.setLanguageCode('tr');
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print('${ETextsPackage.resetPasswordError} ${e.message}');
      rethrow;
    }
  }

  // Change Password
  @override
  Future<void> changePassword(
      String newPassword, String confirmNewPassword) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await user.updatePassword(newPassword);
    } else {
      throw Exception(ETextsPackage.noUser);
    }
  }

  // SignIn
  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print('${ETextsPackage.signInError} ${e.message}');
      rethrow;
    }
  }

  // SignOut
  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print('${ETextsPackage.signOutError} ${e.message}');
      rethrow;
    }
  }
}
