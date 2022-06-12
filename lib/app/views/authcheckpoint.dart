import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metrobike/Auth/register.dart';
import 'package:metrobike/Services/AuthService.dart';
import 'package:metrobike/app/views/dashboard.dart';
import 'package:provider/provider.dart';

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

    return userData != null
        ? userData.hasDoneSetup == 1
            ? DashboardComStateful()
            : Register()
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
