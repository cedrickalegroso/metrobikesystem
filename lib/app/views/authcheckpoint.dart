import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metrobike/Auth/register.dart';
import 'package:metrobike/Auth/verifyacc.dart';
import 'package:metrobike/Services/AuthService.dart';
import 'package:metrobike/app/views/dashboard.dart';
import 'package:provider/provider.dart';

import '../../Auth/autheditprofile.dart';
import '../../Auth/emailverify.dart';
import '../../Services/Models.dart';
import 'homepage.dart';

class CheckPointStateful extends StatefulWidget {
  @override
  _CheckPointStateful createState() => _CheckPointStateful();
}

class _CheckPointStateful extends State<CheckPointStateful> {
  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserData?>();
 final firebaseuser = context.watch<User>();
    return userData != null
        ? userData.hasDoneSetup == true
            ? firebaseuser.emailVerified == true
             ? userData.hasDoneAccSetup == true
              ? DashboardComStateful()
              : AuthEditProfile()
              : const VerifyEmail()
            : const Register()

            // ? DashboardComStateful()
            // : Register()

            // ? userData.isverified == true
            //   ? DashboardComStateful()
            //   : Verifyacc1()
            // : Register()


        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          );


  }
}
