part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignInGoogleEvent extends AuthEvent {}
