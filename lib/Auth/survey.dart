import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

 
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<Survey> {
  @override

  
  void initState() {
    super.initState();
    // DatabaseService().userData;
    
  }


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final screenData = MediaQuery.of(context);
    // final user = context.watch<User>();
    
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(48),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children:  [
                        Container(
                  
                            width: MediaQuery.of(context).size.width / 2,
                            padding: const EdgeInsets.all(1),
                            child: const  Image(image: AssetImage('assets/personalize.png')),
                          ),

                      Container(
                   padding: const EdgeInsets.only(top: 32.0),
                            width: MediaQuery.of(context).size.width / 1,
                          
                            child: const  Text("What are you using MetroBike for?",
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 32,
                            color: Color(0xff117AFF),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                          ),

                     
                    LinearProgressIndicator(
              value: 20,
              semanticsLabel: 'Linear progress indicator',
            ),
                    ],
                  ),
                ),
             
                Container(
                    padding: const EdgeInsets.only(top: 16.0),
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
                        onPressed: null,
                        child: const Text(
                          'Start Survey',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                      height: MediaQuery.of(context).size.width / 7,
                      width: MediaQuery.of(context).size.width / 1,
                      padding: const EdgeInsets.all(1),
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                  width: 2.0, color: Color(0xff117AFF)),
                            )),
                        onPressed: null,
                        child: const Text(
                          'Remind me later',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 16,
                            color: Color(0xff117AFF),
                          ),
                        ),
                      ),
                    )),
              ]),
        ));
  }
}
