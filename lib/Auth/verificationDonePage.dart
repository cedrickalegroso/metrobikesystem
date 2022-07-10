import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class VerifyaccPageDone extends StatefulWidget {
  const VerifyaccPageDone({Key? key}) : super(key: key);

  static const String assetName = 'assets/secure.svg';
  @override
  _VerifyaccPageDonePageState createState() => _VerifyaccPageDonePageState();
}

class _VerifyaccPageDonePageState extends State<VerifyaccPageDone> {
  @override
  void initState() {
    super.initState();
    // DatabaseService().userData;
  }

  @override
  Widget build(BuildContext context) {
    final screenData = MediaQuery.of(context);
    final user = context.watch<User>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(48),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.all(1),
                        child:
                            const Image(image: AssetImage('assets/check.png')),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 32.0),
                        width: MediaQuery.of(context).size.width / 1,
                        child: const Text("You're all set!",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 40,
                              color: Color(0xff117AFF),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                              "Verification usually takes 1-2 days prior to submission of application, we will send updates through your registered email. Should you have any concerns please contact out support.",
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ])),
                Container(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Container(
                      height: MediaQuery.of(context).size.width / 7,
                      width: MediaQuery.of(context).size.width / 1,
                      padding: const EdgeInsets.all(1),
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff117AFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/verifyaccpage');
                        },
                        child: const Text(
                          'Back to Home',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
              ]),
        ),
      ))),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/devpage');
              },
              child: const Text('DEV MODE',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 16,
                    color: Color(0xff117AFF),
                  ),
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
