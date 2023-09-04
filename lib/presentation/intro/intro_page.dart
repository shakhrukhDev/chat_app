import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramm_clone/constants/app_color.dart';
import 'package:telegramm_clone/constants/routes/routes_name.dart';
import 'package:telegramm_clone/constants/widgets/text_styles.dart';
import 'package:telegramm_clone/presentation/intro/bloc/intro_bloc.dart';
import 'package:telegramm_clone/presentation/intro/widgets/intro_item.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<IntroBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        toolbarHeight: 72.h,
        actions: [
          Padding(
            padding:  EdgeInsets.only(top: 43.w, right: 20.w),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                    minimumSize: Size(70.w, 30.h),
                    backgroundColor: AppColors.blue.withOpacity(0.35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    )),
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Center(
                  child: Text(
                    "Skip",
                    style: AppStyle.inter14xW500Black,
                  ),
                )),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView.builder(
          itemCount: bloc.introList.length,
          itemBuilder: (context, index) {
            return IntroItemPage(introModel: bloc.introList[index]);
          },
        ),
      ),
     /* bottomNavigationBar: Column(
        children: [
           BlocBuilder<IntroBloc, IntroState>(
            buildWhen: (prev, cur) => cur is IntroPageChangedState,
            builder: (context, state) {
              var page = bloc.pageController.page?.toInt() ?? 0;
              if (state is IntroPageChangedState) {
                page = state.page;
              }
              final hasGetStartButton = page == bloc.introList.length - 1;
              return ElevatedButton(
                  onPressed: () {
                    bloc.add(
                      hasGetStartButton
                          ? IntroGetStartPressed()
                          : IntroNextPressed(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: Size(320.w, 55.h),
                      backgroundColor: AppColors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      )),
                  child: Text(
                    hasGetStartButton ? "Get Start" : "Next",
                    style: AppStyle.inter18xW500White,
                  )
              );
            },
          )
        ],
      ),*/
    );
  }
}
