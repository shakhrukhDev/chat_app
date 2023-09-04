import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<SignInEvent>(_login);
    on<SignInGoogleEvent>(_regstrWithGoogle);
  }

  Future<void> _login(SignInEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(firebase: Status.loading));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(state.copyWith(firebase: Status.success));
    } on FirebaseAuthException catch (e) {
      print("Error---->${e.code}");
      emit(state.copyWith(firebase: Status.error));
    }
  }

  Future<void> _regstrWithGoogle(
      SignInGoogleEvent event, Emitter<LoginState> emit) async {
    final _googleSign = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      final GoogleSignInAccount? googleUser = await _googleSign.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      print(userCredential.user);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return null;
    } catch (e) {
      print("ERROR==============>${e}");
      return null;
    }
  }
}
