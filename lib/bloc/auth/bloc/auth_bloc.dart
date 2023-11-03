import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edproject/dataSource/auth_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authDataSource = AuthDataSource();
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      emit(AuthGoogleSignLoading());

      final userCredential = await authDataSource.signInWithGoogle();

      emit(AuthGoogleSignSuccess(userCredential: userCredential));
    });
  }
}
