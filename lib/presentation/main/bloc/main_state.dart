part of 'main_bloc.dart';

@immutable

class MainState extends Equatable {

  final BottomMenu bottomMenu;

  const MainState({this.bottomMenu = BottomMenu.chats});

  MainState copyWith({BottomMenu? bottomMenu}) =>
      MainState(bottomMenu: bottomMenu ?? this.bottomMenu);

  @override
  List<Object?> get props => [
    bottomMenu,
  ];

}