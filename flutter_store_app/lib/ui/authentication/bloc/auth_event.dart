part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  final String fullName;

  AuthSignUp({
    required this.email,
    required this.password,
    required this.fullName,
  });
}
