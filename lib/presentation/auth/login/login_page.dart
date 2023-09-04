import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telegramm_clone/constants/app_color.dart';
import 'package:telegramm_clone/constants/app_icon.dart';
import 'package:telegramm_clone/constants/routes/routes_name.dart';
import 'package:telegramm_clone/constants/widgets/text_styles.dart';
import 'package:telegramm_clone/presentation/auth/login/bloc/login_bloc.dart';
import 'package:telegramm_clone/presentation/main/main_page.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MainPage();
            } else {
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Login", style: AppStyle.inter30xW600White,
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        "Enter your 10-digit mobile number to continue.",
                        style: AppStyle.inter16xW400White,
                      )
                    ],
                  ),
                  shape: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blue),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                  ),
                  toolbarHeight: 200.h,
                  backgroundColor: AppColors.blue,
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 40.h),
                        TextFormField(
                          validator: _emailValidator,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Enter your email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28.r)),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        TextFormField(
                          obscureText: _obscureText,
                          validator: _passwordValidator,
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: "Enter mobile number",
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28.r),
                              borderSide: const BorderSide(color: AppColors.blue),
                            ),
                          ),
                        ),
                        SizedBox(height: 68.h),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 55),
                              backgroundColor: AppColors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.r),
                              )),
                          onPressed: () {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              context.read<LoginBloc>().add(SignInEvent(
                                  password: passwordController.text,
                                  email: emailController.text));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "The information is incomplete",
                                    style: TextStyle(fontSize: 12, color: Colors.red),
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Login",
                            style: AppStyle.inter18xW500White,
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
/*ElevatedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(SignInWithGoogleEvent());
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:Colors.red[50],
                            fixedSize: const Size(116, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppIcons.googleIcon),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Google",
                              style: AppStyle.poppins12xW400Gray,
                            )
                          ],
                        ),
                      ),*/
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(18),
                                backgroundColor: AppColors.blueAccent,
                              ),
                              child: SvgPicture.asset(
                                AppIcons.arrowIcon,
                              ),
                              onPressed: () {
                                print("================================================");
                                context.read<LoginBloc>().add(SignInGoogleEvent());
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h,),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account  ",
                              style: AppStyle.inter12xW400Black,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Sign Up',
                                  style: AppStyle.inter12xW600Blue,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, RoutesName.signup);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
