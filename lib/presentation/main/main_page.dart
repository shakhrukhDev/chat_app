import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegramm_clone/constants/app_icon.dart';
import 'package:telegramm_clone/presentation/main/bloc/main_bloc.dart';
import 'package:telegramm_clone/presentation/main/chats/chats_page.dart';
import 'package:telegramm_clone/presentation/main/contacts/contacts_page.dart';
import 'package:telegramm_clone/presentation/main/settings/settings_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.bottomMenu.index,
            children: [
              ChatsPage(),
              ContactsPage(),
              SettingsPage(),
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 60.h,
            child: BottomNavigationBar(

              backgroundColor: Colors.white,
              currentIndex: state.bottomMenu.index,
              onTap: (index) {
                context
                    .read<MainBloc>()
                    .add(SetBottomMenuEvent(menu: BottomMenu.values[index]
                )
                );
              },
              items: [
                BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.chatIcon,),  label: 'Chats'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppIcons.personIcon), label: 'Contacts'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppIcons.settingsIcon), label: 'Settings'),
              ],
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.deepPurple,
            ),
          ),
        );
      },
    );
  }
}
