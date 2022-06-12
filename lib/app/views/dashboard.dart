

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../Services/AuthService.dart';
import '../../Services/Models.dart';


class DashboardComStateful extends StatefulWidget {
  @override
  _DashboardComStateful createState() => _DashboardComStateful();
}

class _DashboardComStateful extends State<DashboardComStateful> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: OBJ DETECTION',
      style: optionStyle,
    ),
    Text(
      'Index 2: Settings',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserData?>();
    return 
             Scaffold(
                appBar: AppBar(
                  title: Text(
                    userData!.username,
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  backgroundColor: Colors.white,
                ),
                body: Center(
                  child: Column(children: [
                    const Text('Community'),
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
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthService>().signout();
                      },
                      child: Text("Sign Out"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/addPost');
                      },
                      child: Text("add Post"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Sign wew"),
                    ),
                    _widgetOptions.elementAt(_selectedIndex)
                  ]),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.business),
                      label: 'Business',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.business),
                      label: 'Business',
                    )
                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.amber[800],
                  onTap: _onItemTapped,
                ),
              );
           
    
  }
}
