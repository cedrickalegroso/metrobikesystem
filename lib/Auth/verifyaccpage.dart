import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Verifyaccpage extends StatefulWidget {
  const Verifyaccpage({Key? key}) : super(key: key);

  static const String assetName = 'assets/secure.svg';
  @override
  _VerifyaccpagePageState createState() => _VerifyaccpagePageState();
}

class _VerifyaccpagePageState extends State<Verifyaccpage> {
  @override
  void initState() {
    super.initState();
    // DatabaseService().userData;
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   String dropdownValue = 'Select Card';


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
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 32.0),
                        width: MediaQuery.of(context).size.width / 1,
                        child: const Text("Verify your",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 40,
                              color: Color(0xff117AFF),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      const Text("account",
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 40,
                            color: Color(0xff117AFF),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 8,
                ),
                  Container(
                  height: MediaQuery.of(context).size.width / 8,
                  width: MediaQuery.of(context).size.width / 1,
                  padding: const EdgeInsets.all(1),
                  child: DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      iconEnabledColor: const Color(0xff117AFF),
       isExpanded: true,
      style: const TextStyle(fontSize: 16,color: Color(0xff117AFF)),
      underline: Container(
        height: 2,
        color:  const Color(0xff117AFF),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Select Card', 'Two', 'Free', 'One']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    )
                ),
                Container(
                  height: MediaQuery.of(context).size.width / 8,
                  width: MediaQuery.of(context).size.width / 1,
                  padding: const EdgeInsets.all(1),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff117AFF), width: 2.0),
                      ),
                      labelText: 'Name on Card',
                      labelStyle: TextStyle(color: Color(0xff117AFF)),
                    ),
                  ),
                ),
                 Container(
                  height: MediaQuery.of(context).size.width / 8,
                  width: MediaQuery.of(context).size.width / 1,
                  padding: const EdgeInsets.all(1),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff117AFF), width: 2.0),
                      ),
                      labelText: 'Card No.',
                      labelStyle: TextStyle(color: Color(0xff117AFF)),
                    ),
                  ),
                ),
                   Container(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                              "Attachments should be 1 Selfie picture with your ID, Two (2) One (1) front and One (1) back of your ID.",
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ])),
                         SizedBox(
                  height: MediaQuery.of(context).size.width / 8,
                ),
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
                          'Submit',
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                              "Verifications usually take 1-2 days prior to submission of application.",
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ])),
              ]),
        ));
  }
}
