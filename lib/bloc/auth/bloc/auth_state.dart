part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthGoogleSignLoading extends AuthState {}

final class AuthGoogleSignSuccess extends AuthState {
  final UserCredential? userCredential;

  AuthGoogleSignSuccess({required this.userCredential});
}

final class GetUserAuthLoading extends AuthState {}

final class GetUserAuthSuccess extends AuthState {
  final UserResponse? userResponse;
  final String email;

  GetUserAuthSuccess({required this.userResponse, required this.email});
}
