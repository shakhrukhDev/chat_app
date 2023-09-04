part of 'intro_bloc.dart';

@immutable
abstract class IntroEvent {}

class IntroModelEvent extends IntroEvent {
  IntroModelEvent();
}


class IntroNextPressed extends IntroEvent {}

class IntroPageScrolled extends IntroEvent {}

class IntroGetStartPressed extends IntroEvent {}
