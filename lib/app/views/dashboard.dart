

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../Services/AuthService.dart';
import '../../Services/Models.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class DashboardComStateful extends StatefulWidget {
  @override
  _DashboardComStateful createState() => _DashboardComStateful();
}

class _DashboardComStateful extends State<DashboardComStateful> {
  int _selectedIndex = 0;

   late GoogleMapController mapController;

 final LatLng _center = const LatLng(10.7184086, 122.5485873);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
 
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
                body:  GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
                bottomNavigationBar: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Simpas',
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
                  selectedItemColor: const Color(0xff117AFF),
                  onTap: _onItemTapped,
                ),
              );
           
    
  }
}
