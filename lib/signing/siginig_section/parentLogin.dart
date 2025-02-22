import 'dart:developer';

import 'package:dujo_offical_apk/signing/Get_students/get_students_drop_downlist.dart';
import 'package:dujo_offical_apk/signing/dujo_sign_up/parent_sign_up/parent_dujoSiginUp.dart';
import 'package:dujo_offical_apk/signing/siginig_section/student_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/parent_home/parent_home_screen.dart';

class ParentLoginSection extends StatelessWidget {
  var classID;
  var schoolID;
  ParentLoginSection({
    super.key,
    required this.classID,
    required this.screenSize,
    required this.schoolID,
  });
  TextEditingController _idController = TextEditingController();
  TextEditingController _passwoedController = TextEditingController();

  final Size screenSize;

  @override
  Widget build(BuildContext context) {

    log(schoolID);
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenSize.width * 1 / 13),
            child: Container(
              height: screenSize.width * 0.13,
              decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                  controller: _idController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Email ID',
                      prefixIcon: Icon(Icons.mail_lock_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      )),
                  style: TextStyle(fontSize: 20)),
            ),
          ),
          SizedBox(
            height: screenSize.width * 1 / 50,
          ),
          Padding(
            padding: EdgeInsets.only(
                // top: screenSize.width * 1 / 36,
                left: screenSize.width * 1 / 12,
                right: screenSize.width * 1 / 13),
            child: Container(
              height: screenSize.width * 0.13,
              decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(19)),
              child: TextField(
                controller: _passwoedController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: TextStyle(fontSize: 19),
                  hintText: 'Password',
                ),
                style: TextStyle(fontSize: 19),
                obscureText: true,
              ),
            ),
          ),
          SizedBox(
            height: screenSize.width * 1 / 23,
          ),
          InkWell(
            child: Padding(
              padding: EdgeInsets.only(left: screenSize.width * 1 / 1.9),
              child: Text(
                "Forgot Password ?",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {
              ;
            },
          ),
          SizedBox(height: screenSize.width * 1 / 36),
          Container(
            height: screenSize.width * 1 / 7,
            width: screenSize.width * 1 / 1.2,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(14)),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                padding: const EdgeInsets.all(9.0),
                textStyle: const TextStyle(fontSize: 17),
              ),
              onPressed: () async {
                log(_idController.text.trim());
                try {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _idController.text.trim(),
                          password: _passwoedController.text.trim())
                      .then((value) => Get.to(ParentHomeScreen(
                            classId: classID,
                            schoolId: schoolID,
                            parentmailId: _idController.text.trim(),
                          )));
                } catch (e) {
                  errorBox(context, e);
                }
              },
              child: const Text('SIGN IN'),
            ),
          ),
          SizedBox(height: screenSize.width * 1 / 100),
          Padding(
            padding: EdgeInsets.only(
                left: screenSize.width * 1 / 4.3,
                top: screenSize.width * 1 / 29),
            child: Row(children: [
              Text(
                "Don't have an account ? ",
                style: TextStyle(color: Colors.white),
              ),
              InkWell(
                child: Container(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 19, color: Colors.yellowAccent),
                  ),
                ),
                onTap: () {
                  Get.to(ParentDujoSignup(
                    schoolID: schoolID,
                    classID: classID,
                  ));
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
