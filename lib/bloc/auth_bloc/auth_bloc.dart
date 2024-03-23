import 'package:expense_repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(
    this.authRepository,
  ) : super(AuthInitial()) {
    // Login
    on<LoggedIn>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.signIn(event.email, event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError('${ETexts.loggedIn} $e'));
      }
    });

    // Logout
    on<LoggedOut>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.signOut();
        emit(Unauthenticated());
      } catch (e) {
        emit(AuthError('${ETexts.loggedOut} $e'));
      }
    });

    // Register
    on<Registered>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.register(
            event.fullName, event.email, event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError('${ETexts.registered} $e'));
      }
    });

    // Forgot Password
    on<ForgotPassword>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.forgotPassword(event.email);
      } catch (e) {
        emit(AuthError('${ETexts.resetPassword} $e'));
      }
    });

    // Change Password
    on<ChangePassword>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.changePassword(
            event.newPassword, event.confirmNewPassword);
      } catch (e) {
        emit(AuthError('${ETexts.changePassword} $e'));
      }
    });
  }
}
