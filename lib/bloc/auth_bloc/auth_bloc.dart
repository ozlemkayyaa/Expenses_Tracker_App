import 'package:equatable/equatable.dart';
import 'package:expense_repository/auth_repository.dart';
import 'package:expense_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final FirebaseAuth _firebaseAuth;
  final UserRepository _userRepository;

  AuthBloc(this._authRepository, this._userRepository,
      {FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        super(AuthInitial()) {
    /*      
    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(Authenticated(user: user));
      } else {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(Unauthenticated());
      }
    }
    );
*/
    // Login
    on<LoggedIn>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authRepository.signIn(event.email, event.password);
        await _userRepository.fetchUser(UserModel(
          email: event.email,
        ));
        emit(Authenticated(user: _firebaseAuth.currentUser));
      } on FirebaseAuthException catch (e) {
        emit(AuthError('${ETexts.loggedIn} $e'));
      }
    });

    // Logout
    on<LoggedOut>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authRepository.signOut();
        emit(Unauthenticated());
      } catch (e) {
        emit(AuthError('${ETexts.loggedOut} $e'));
      }
    });

    // Register
    on<Registered>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authRepository.register(
            event.fullName, event.email, event.password);
        await _userRepository.createUser(UserModel(
          fullName: event.fullName,
          email: event.email,
        ));

        emit(const Authenticated());
      } on FirebaseAuthException catch (e, stackTrace) {
        print('Hata: $e');
        print('Stack Trace: $stackTrace');

        //catch (e) {
        emit(AuthError('${ETexts.registered} $e'));
      }
    });

    // Forgot Password
    on<ForgotPassword>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authRepository.forgotPassword(event.email);
      } catch (e) {
        emit(AuthError('${ETexts.resetPassword} $e'));
      }
    });

    // Change Password
    on<ChangePassword>((event, emit) async {
      emit(AuthLoading());
      try {
        if (event.newPassword == event.confirmNewPassword) {
          await _authRepository.changePassword(
              event.newPassword, event.confirmNewPassword);
        }
      } catch (e) {
        emit(AuthError('${ETexts.changePassword} $e'));
      }
    });

    // Delete Account
    on<DeleteUser>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authRepository.deleteAccount();
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    });
  }
}
