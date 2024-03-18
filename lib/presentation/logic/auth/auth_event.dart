part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class Login extends AuthEvent {
  final String phoneNumber;

  Login({required this.phoneNumber});
}
