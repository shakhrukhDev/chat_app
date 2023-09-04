import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramm_clone/constants/app_color.dart';
import 'package:telegramm_clone/constants/widgets/text_styles.dart';
import 'package:telegramm_clone/presentation/intro/bloc/intro_bloc.dart';

class IntroItemPage extends StatelessWidget {
  const IntroItemPage({super.key, required this.introModel});

  final IntroModel introModel;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<IntroBloc>();
    return Padding(
      padding: EdgeInsets.only(left: 36.w, right: 36.w),
      child: Column(
        children: [
          SizedBox(
            height: 285.h,
            width: 285.w,
            child: Image.asset(introModel.image),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(introModel.description,
              textAlign: TextAlign.center, style: AppStyle.inter18xW500Black),
        ],
      ),
    );
  }
}
