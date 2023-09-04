import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegramm_clone/constants/app_color.dart';
import 'package:telegramm_clone/constants/app_icon.dart';
import 'package:telegramm_clone/constants/app_images.dart';
import 'package:telegramm_clone/constants/routes/routes_name.dart';
import 'package:telegramm_clone/constants/widgets/text_styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: AppStyle.inter18xW500White,
        ),
        elevation: 0,
        backgroundColor: AppColors.blue,
        toolbarHeight: 82.h,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 80.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.blueAccent),

            ),
            SizedBox(
              height: 32.h,
            ),
            ListTile(
              leading: SvgPicture.asset(AppIcons.userEditIcon),
              title: Text(
                "Edit Profile",
                style: AppStyle.inter16xW400Black,
              ),
              trailing: SvgPicture.asset(AppIcons.arrowIcon),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(AppIcons.userBlockedIcon),
              title: Text(
                "Blocked users",
                style: AppStyle.inter16xW400Black,
              ),
              trailing: SvgPicture.asset(AppIcons.arrowIcon),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.delete_outline_outlined),
              title: Text(
                "Delete account",
                style: AppStyle.inter16xW400Black,
              ),
              trailing: SvgPicture.asset(AppIcons.arrowIcon),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(AppIcons.policyIcon),
              title: Text(
                "Privacy policy",
                style: AppStyle.inter16xW400Black,
              ),
              trailing: SvgPicture.asset(AppIcons.arrowIcon),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(AppIcons.termsIcon),
              title: Text(
                "Terms & condition",
                style: AppStyle.inter16xW400Black,
              ),
              trailing: SvgPicture.asset(AppIcons.arrowIcon),
              onTap: () {},
            ),
            ListTile(
              leading: SvgPicture.asset(AppIcons.logoutIcon),
              title: Text(
                "Logout",
                style: AppStyle.inter16xW400Black,
              ),
              trailing: SvgPicture.asset(AppIcons.arrowIcon),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, RoutesName.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
