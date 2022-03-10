import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_sell/const/app_color.dart';
import 'package:first_sell/ui/homeScreen.dart';
import 'package:first_sell/ui/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      var authCredentional = userCredential.user;
      print(authCredentional!.uid);
      if (authCredentional.uid.isNotEmpty) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        Fluttertoast.showToast(
            msg: "Some thing is rong", backgroundColor: AppColors.deep_orange);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: "No user found for that email.",
            backgroundColor: AppColors.deep_orange);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "Wrong password provided for that user.",
            backgroundColor: AppColors.deep_orange);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_orange,
      body: Column(
        children: [
          Container(
            height: 170.h,
            width: ScreenUtil().screenWidth,
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 35.w, left: 20.w),
              child: Text("Sign In",
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
          Expanded(
            child: Container(
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(28.r),
                    topLeft: Radius.circular(28.r),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                            fontSize: 22.sp, color: AppColors.deep_orange),
                      ),
                      Text(
                        "Glad to see you back my buddy.",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFFBBBBBB),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48.h,
                            width: 41.w,
                            decoration: BoxDecoration(
                                color: AppColors.deep_orange,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Center(
                              child: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                                size: 20.w,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: "thed9954@gmail.com",
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFF414041),
                                ),
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(
                                  fontSize: 15.sp,
                                  color: AppColors.deep_orange,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48.h,
                            width: 41.w,
                            decoration: BoxDecoration(
                                color: AppColors.deep_orange,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white,
                                size: 20.w,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _passwordController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                hintText: "password must be 6 character",
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFF414041),
                                ),
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(
                                  fontSize: 15.sp,
                                  color: AppColors.deep_orange,
                                ),
                                suffixIcon: _obscureText == true
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = false;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove_red_eye,
                                          size: 20.w,
                                        ))
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = true;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.visibility_off,
                                          size: 20.w,
                                        )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: 1.sw,
                        height: 56.h,
                        child: ElevatedButton(
                          onPressed: () => signIn(),
                          child: const Text("Sign In"),
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.deep_orange),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Wrap(
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFBBBBBB),
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              " Sign Up",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.deep_orange,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (_) => const SignUpScreen()));
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
