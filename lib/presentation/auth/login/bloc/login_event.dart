part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class SignInEvent extends LoginEvent{
  final String email;
  final String password;

  SignInEvent({required this.email,required this.password});
}

class SignInGoogleEvent extends LoginEvent{

  SignInGoogleEvent();
  @override
  List<Object?> get props=>[];
}