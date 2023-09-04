import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:telegramm_clone/constants/app_images.dart';
part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(const IntroState()) {
   on<IntroModelEvent>(_introItem);

   on<IntroNextPressed>((event, emit) {
     pageController.nextPage(
       duration: const Duration(milliseconds: 300),
       curve: Curves.linear,
     );
   });


   on<IntroPageScrolled>((event, emit) {
     emit(IntroPageChangedState(page: pageController.page?.toInt() ?? 0));
   });
  }



  void _introItem(IntroModelEvent event, Emitter<IntroState> emit){
    emit(state.copyWith(items: introList));
  }

  final PageController pageController = PageController();


  final List<IntroModel> introList = [
    IntroModel(
      description: "Welcome to chat boat,\na great friend to chat \nwith you",
      image: AppImages.introImage,
    ),
    IntroModel(
      description: "If you are confused about \nwhat to do just open \nChat boat app",
      image: AppImages.introImage,
    ),
    IntroModel(
      description: "Chat boat will be ready \nto chat & make you \nhappy",
      image: AppImages.introImage,
    ),
  ];
}

class IntroModel{
  String image;
  String description;

  IntroModel({required this.image,required this.description});
}