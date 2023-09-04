part of 'splash_bloc.dart';

@immutable
abstract class SplashState extends Equatable{}

class SplashInitial extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashEnded extends SplashState{
  final String route;

  SplashEnded({required this.route});

  @override
  List<Object?> get props => [route];
}

