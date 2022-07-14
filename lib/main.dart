import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:metrobike/app/MainAuthPage.dart';
import 'package:metrobike/firebase_options.dart';
import 'package:metrobike/misc/onboarding.dart';
import 'package:metrobike/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Services/AuthService.dart';
import 'package:shared_preferences/shared_preferences.dart';



int? initScreen;
void main() async {
   


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen =  await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1); 


  const bool USE_EMULATOR = true;

  if (USE_EMULATOR) {
    // [Firestore | 10.0.2.2:8080]
    FirebaseFirestore.instance.settings = const Settings(
      host: '10.0.2.2:8080',
      sslEnabled: false,
      persistenceEnabled: false,
    );

    // [Authentication | 10.0.2.2:9099]
    await FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 9099);

    // [Storage | 10.0.2.2:9199]
    await FirebaseStorage.instance.useStorageEmulator('10.0.2.2', 9199);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   print('initScreen $initScreen');
    return MultiProvider(
        providers: [
          Provider<AuthService>(
            create: (_) => AuthService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<AuthService>().authStateChanges,
            initialData: null,
          ),
        ],
        child: MaterialApp(
          title: 'MetroBike',
          onGenerateRoute: RouteGenerator.generateRoute,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            primarySwatch: Colors.blue,
          ),
          home: initScreen == null ? const Onboardingpage() : MainAuthPage(),
        ));
  }
}
