import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:telegramm_clone/constants/routes/routes_name.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInitialEvent>((event, emit) {
      final user = FirebaseAuth.instance.currentUser;
      if(user != null){
        emit(SplashEnded(route: RoutesName.main));
      }else{
        emit(SplashEnded(route: RoutesName.login));
      }
    });
  }
}
