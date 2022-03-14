import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_sell/ui/bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../const/app_color.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  List<String> gender = ["Male", "Female", "Other"];

  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
    }
  }

  sendUserDataToDb() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var curentUser = _auth.currentUser;

    CollectionReference _collentionRef =
        FirebaseFirestore.instance.collection("users-forms-data");
    return _collentionRef
        .doc(curentUser!.email)
        .set({
          "name": _nameController.text,
          "phone": _phoneController.text,
          "dob": _dobController.text,
          "gender": _genderController.text,
          "age": _ageController.text,
        })
        .then((value) => Fluttertoast.showToast(
            msg: 'You have submitted', backgroundColor: AppColors.deep_orange))
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomeNavigationBar())))
        .catchError((err) => print(err));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Submit the form to continue.",
                  style:
                      TextStyle(fontSize: 22.sp, color: AppColors.deep_orange),
                ),
                Text(
                  "We will not share your information with anyone.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFFBBBBBB),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                // myTextField("enter your name",TextInputType.text,_nameController),
                // myTextField("enter your phone number",TextInputType.number,_phoneController),
                // Form Start Here
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: "Full Name",
                  ),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                  ),
                ),
                TextField(
                  controller: _dobController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "date of birth",
                    suffixIcon: IconButton(
                      onPressed: () {
                        _selectDateFromPicker(context);
                      },
                      icon: const Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                ),
                TextField(
                  controller: _genderController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "choose your gender",
                    prefixIcon: DropdownButton<String>(
                      items: gender.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                          onTap: () {
                            setState(() {
                              _genderController.text = value;
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ),
                // myTextField("enter your age",TextInputType.number,_ageController),
                TextField(
                  controller: _ageController,
                  decoration: const InputDecoration(hintText: "Age"),
                ),
                SizedBox(
                  height: 50.h,
                ),

                // elevated button
                //  customButton("Continue",()=>sendUserDataToDB()),
                SizedBox(
                    width: 1.sw,
                    child: ElevatedButton(
                        onPressed: () {
                          sendUserDataToDb();
                        },
                        child: const Text("Container")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
