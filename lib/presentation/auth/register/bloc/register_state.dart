part of 'register_bloc.dart';

@immutable


class RegisterState extends Equatable{
final Status firebase;

const RegisterState({this.firebase = Status.initial});

RegisterState copyWith({Status? firebase}){
  return RegisterState(firebase: firebase??this.firebase);
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

