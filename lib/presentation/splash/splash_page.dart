import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramm_clone/constants/app_images.dart';
import 'package:telegramm_clone/presentation/splash/bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashEnded) {
          Navigator.pushReplacementNamed(context, state.route);
          print("===============================================");
        }
      },
      child: Scaffold(
          body: SizedBox(
              height: MediaQuery.of(context).size.height.h,
              width: MediaQuery.of(context).size.width.w,
              child: Image.asset(
                AppImages.splashScreen,
                fit: BoxFit.cover,
              ))),
    );
  }
}

