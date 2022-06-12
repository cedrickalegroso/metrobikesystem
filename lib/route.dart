import 'package:flutter/material.dart';
import 'package:metrobike/Auth/jointoday.dart';
import 'package:metrobike/Auth/register.dart';
import 'package:metrobike/Auth/survey.dart';
import 'package:metrobike/Auth/verifyaccpage.dart';



import 'package:metrobike/app/MainAuthPage.dart';
import 'package:metrobike/app/views/homepage.dart';

// screens
import 'package:metrobike/auth/jointoday.dart' as jointayo;
import 'package:metrobike/auth/register.dart' as registertayo;

import 'Auth/personalize.dart';
import 'Auth/verifyacc.dart';
import 'Auth/survey.dart';
import 'devpage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments; //to be used if passing of arguments during navigation is required

    switch (settings.name) {
      case '/jointoday': // @carl gin add ko di kay from splashscreen after 5 seconds ma navigate sya sa wrapper hehe
        return MaterialPageRoute(builder: (_) => JoinToday());
      // case '/register':
      //   return MaterialPageRoute(builder: (_) => Register());
      case '/devpage':
        return MaterialPageRoute(builder: (_) => DevPage());
      case '/mainAuthPage':
        return MaterialPageRoute(builder: (_) => MainAuthPage());
            case '/homepage':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/verifyacc1':
        return MaterialPageRoute(builder: (_) => const Verifyacc1());
      case '/verifyaccpage':
        return MaterialPageRoute(builder: (_) => const Verifyaccpage());
      case '/personalize':
        return MaterialPageRoute(builder: (_) => const PersonalizeMessage());
      case '/survey':
        return MaterialPageRoute(builder: (_) =>  Survey());

      default:
        return MaterialPageRoute(builder: (_) => JoinToday());
    }
  }
}
