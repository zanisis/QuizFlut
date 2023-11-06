part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignInGoogleEvent extends AuthEvent {}

class GetUserAuth extends AuthEvent {
  final String email;

  GetUserAuth({required this.email});
}
