import 'package:first_sell/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
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
