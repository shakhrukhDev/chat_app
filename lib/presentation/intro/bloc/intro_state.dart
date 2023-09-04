part of 'intro_bloc.dart';

@immutable
class IntroState extends Equatable {
  final List<IntroModel> items;

  const IntroState({this.items = const []});

  IntroState copyWith({List<IntroModel>? items}) {
    return IntroState(items: items ?? this.items);
  }

  @override
  List<Object?> get props => [items];
}

class IntroPageChangedState extends IntroState {
  final int page;

  const IntroPageChangedState({required this.page});
}

class IntroToLoginState extends IntroState {}
