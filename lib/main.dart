import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:telegramm_clone/constants/routes/app_routes.dart';
import 'package:telegramm_clone/constants/routes/routes_name.dart';
import 'package:telegramm_clone/presentation/auth/login/bloc/login_bloc.dart';
import 'package:telegramm_clone/presentation/auth/register/bloc/register_bloc.dart';
import 'package:telegramm_clone/presentation/intro/bloc/intro_bloc.dart';
import 'package:telegramm_clone/presentation/main/bloc/main_bloc.dart';
import 'package:telegramm_clone/presentation/main/chats/bloc/chats_bloc.dart';
import 'package:telegramm_clone/presentation/main/contacts/bloc/contacts_bloc.dart';
import 'package:telegramm_clone/presentation/main/settings/bloc/settings_bloc.dart';
import 'package:telegramm_clone/presentation/splash/bloc/splash_bloc.dart';
import 'package:telegramm_clone/presentation/splash/splash_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => SplashBloc()..add(SplashInitialEvent())),
      BlocProvider(create: (_)=>ChatsBloc()),
      BlocProvider(create: (_)=>ContactsBloc()),
      BlocProvider(create: (_)=>SettingsBloc()),
      BlocProvider(create: (_)=>LoginBloc()),
      BlocProvider(create: (_)=>IntroBloc()..add(IntroModelEvent())),
      BlocProvider(create: (_)=>RegisterBloc()),
      BlocProvider(create: (_)=>MainBloc()),
    ], child: KeyboardDismisser(
      child: ScreenUtilInit(
          child: MaterialApp(
            home: SplashPage(),
            initialRoute: RoutesName.splash,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          )
      ),
    ));
  }
}
