part of 'login_bloc.dart';

@immutable

class LoginState extends Equatable {

  final Status firebase;

  const LoginState({this.firebase = Status.initial});

  LoginState copyWith({Status? firebase}){
    return LoginState(firebase: firebase??this.firebase);
  }
  @override
  List<Object?> get props => [firebase];

}
enum Status { initial, loading, success, error }

extension FireebaseStatusX on Status{
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}