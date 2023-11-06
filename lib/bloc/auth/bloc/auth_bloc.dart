import 'dart:developer';

import 'package:edproject/dataSource/user_datasource.dart';
import 'package:edproject/model/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edproject/dataSource/auth_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authDataSource = AuthDataSource();
  final userDataSource = UserDataSource();

  AuthBloc() : super(AuthInitial()) {
    on<SignInGoogleEvent>((event, emit) async {
      emit(AuthGoogleSignLoading());
      final userCredential = await authDataSource.signInWithGoogle();

      emit(AuthGoogleSignSuccess(userCredential: userCredential));
    });
    on<GetUserAuth>((event, emit) async {
      emit(GetUserAuthLoading());

      final userResponse = await userDataSource.getUser(event.email);
      log("response: ${userResponse.toJson()}");
      emit(GetUserAuthSuccess(userResponse: userResponse, email: event.email));
    });
  }
}
