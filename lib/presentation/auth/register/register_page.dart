import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramm_clone/constants/app_color.dart';
import 'package:telegramm_clone/constants/routes/routes_name.dart';
import 'package:telegramm_clone/constants/widgets/text_styles.dart';
import 'package:telegramm_clone/presentation/auth/register/bloc/register_bloc.dart';
import 'package:telegramm_clone/presentation/main/main_page.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
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
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MainPage();
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Register",
                        style: AppStyle.inter30xW600White,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text("Fill up your details to register.",
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your name';
                            }
                          },
                          controller: usernameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Name",
                            hintText: "Enter your name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28.r)),
                          ),
                        ),
                        SizedBox(height: 24.h),
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
                            hintText: "Enter your password",
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
                              borderSide:
                                  const BorderSide(color: AppColors.blue),
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
                            context.read<RegisterBloc>().add(SignUpEvent(
                                password: passwordController.text,
                                email: emailController.text));

                            CollectionReference collRef = FirebaseFirestore.instance.collection('client');
                            collRef.add({
                              'name' : usernameController.text,
                              'email' : emailController.text});
                            usernameController.clear();
                            emailController.clear();
                          },
                          child: Text(
                            "Register",
                            style: AppStyle.inter18xW500White,
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account   ",
                              style: AppStyle.inter12xW400Black,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Login',
                                  style: AppStyle.inter12xW600Blue,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                     Navigator.pushNamed(context, RoutesName.login);
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
