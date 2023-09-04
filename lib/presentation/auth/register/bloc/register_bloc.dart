import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<SignUpEvent>(_signUp);
  }

  Future<void> _signUp(SignUpEvent event,Emitter<RegisterState> emit) async {
    emit(state.copyWith(firebase: Status.loading));
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: event.email, password: event.password);
      emit(state.copyWith(firebase: Status.success));
    }on FirebaseAuthException catch(e){
      print('Error-->${e.code}');
      emit(state.copyWith(firebase: Status.error));
    }
  }
}
