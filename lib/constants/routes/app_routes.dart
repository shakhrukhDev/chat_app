import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramm_clone/constants/routes/routes_name.dart';
import 'package:telegramm_clone/presentation/auth/login/bloc/login_bloc.dart';
import 'package:telegramm_clone/presentation/auth/login/login_page.dart';
import 'package:telegramm_clone/presentation/auth/register/bloc/register_bloc.dart';
import 'package:telegramm_clone/presentation/auth/register/register_page.dart';
import 'package:telegramm_clone/presentation/intro/bloc/intro_bloc.dart';
import 'package:telegramm_clone/presentation/intro/intro_page.dart';
import 'package:telegramm_clone/presentation/main/bloc/main_bloc.dart';
import 'package:telegramm_clone/presentation/main/chats/chat_detail/chat_detail_page.dart';
import 'package:telegramm_clone/presentation/main/main_page.dart';
import 'package:telegramm_clone/presentation/splash/bloc/splash_bloc.dart';
import 'package:telegramm_clone/presentation/splash/splash_page.dart';

sealed class AppRoutes {
  AppRoutes._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => SplashPage(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case RoutesName.intro:
        return MaterialPageRoute(
          builder: (context) => IntroPage(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (context) => RegisterPage(),
        );
      case RoutesName.main:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
        );
      case RoutesName.chatDetail:
        return MaterialPageRoute(
          builder: (context) =>  DetailChatPage(name: settings.arguments as String,),
        );
    }
    return null;
  }
}
