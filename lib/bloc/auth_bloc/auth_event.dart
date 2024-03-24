part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// Login
class LoggedIn extends AuthEvent {
  final String email;
  final String password;

  const LoggedIn(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

// SignOut
class LoggedOut extends AuthEvent {}

// Register
class Registered extends AuthEvent {
  final String email;
  final String password;
  final String fullName;

  const Registered(this.email, this.password, this.fullName);

  @override
  List<Object> get props => [email, password, fullName];
}

// Forgot Password
class ForgotPassword extends AuthEvent {
  final String email;

  const ForgotPassword(this.email);

  @override
  List<Object> get props => [email];
}

// Change Password
class ChangePassword extends AuthEvent {
  final String newPassword;
  final String confirmNewPassword;

  const ChangePassword(this.newPassword, this.confirmNewPassword);

  @override
  List<Object> get props => [newPassword, confirmNewPassword];
}

// Delete User
class DeleteUser extends AuthEvent {}
