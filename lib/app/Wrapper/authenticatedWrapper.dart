import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metrobike/Services/DatabaseService.dart';
import 'package:metrobike/Services/Models.dart';
import 'package:provider/provider.dart';

import '../views/authcheckpoint.dart';

class HomeWrapper extends StatefulWidget {
  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User>();
    return firebaseuser != null
        ? MultiProvider(
            providers: [
              Provider<DatabaseService>(
                  create: (_) => DatabaseService(uid: firebaseuser.uid)),
              StreamProvider<UserData?>.value(
                value: DatabaseService(uid: firebaseuser.uid).userData,
                initialData: null,
              ),
            ],
            child: CheckPointStateful(),
          )
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
