part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthGoogleSignLoading extends AuthState {}

final class AuthGoogleSignSuccess extends AuthState {
  final UserCredential? userCredential;

  AuthGoogleSignSuccess({required this.userCredential});
}
