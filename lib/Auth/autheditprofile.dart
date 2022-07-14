// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:metrobike/Services/DatabaseService.dart';
import 'package:metrobike/misc/profileClipper.dart';
import 'package:provider/provider.dart';

import '../Services/Models.dart';

class AuthEditProfile extends StatefulWidget {
  @override
  _AuthEditProfilePageState createState() => _AuthEditProfilePageState();
}

class _AuthEditProfilePageState extends State<AuthEditProfile> {
  @override
  void initState() {
    super.initState();
    // DatabaseService().userData;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  final _imagePicker = ImagePicker();
  String photoURL = "";


   final _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserData?>();
    // final user = context.watch<User>();

     _updateProfilePic(url) async {
         DatabaseService(uid: userData!.uid).updateProfilePhoto(profilePicture: url);
    }


    _imagePick() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('/${userData!.uid}')
          .child('medias')
          .child('profilepicture')
          .child(userData.uid + 'front.png');

      firebase_storage.UploadTask uploadTask;
        uploadTask = ref.putFile(File(image!.path));
        await uploadTask;
      ref.getDownloadURL().then((fileUrl) {
        photoURL = fileUrl;
          _updateProfilePic(photoURL);
      });

     
    }


   _imagePick2() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('/${userData!.uid}')
          .child('medias')
          .child('profilepicture')
          .child(userData.uid + 'front.png');

      firebase_storage.UploadTask uploadTask;
        uploadTask = ref.putFile(File(image!.path));
        await uploadTask;
      ref.getDownloadURL().then((fileUrl) {
        photoURL = fileUrl;
       _updateProfilePic(photoURL);
      });

       
    }


    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                      children: const [
                        Text('Setup your profile',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 40,
                              color: Color(0xff117AFF),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.only(top: 48.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                               _imagePick();    
                              },
                              onDoubleTap: () {
_imagePick2();
                              },
                              child: ClipOval(
                                  clipper: ProfileClipper(),
                                  child: CachedNetworkImage(
                                    imageUrl: userData!.profilePicture,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  )),
                            ),
                               Container(
                               
                                 padding: const EdgeInsets.only(top: 24),
                                child: TextFormField(
                                  controller: _usernameController,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff117AFF), width: 2.0),
                                    ),
                                    labelText: 'Prefered Username',
                                     
                                    labelStyle:
                                        TextStyle(color: Color(0xff117AFF),
                              fontWeight: FontWeight.bold, ),
                                  ),
                                ),
                              ),
                          ])),
                           Container(
                            margin: const EdgeInsets.only(top: 48),
                              height: MediaQuery.of(context).size.width / 8,
                              width: MediaQuery.of(context).size.width / 1,
                          
                              child: ElevatedButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xff117AFF)),
                                onPressed: () async {
                               
                                    dynamic result = await context
                                        .read<DatabaseService>()
                                        .updateUsername(username: _usernameController.text.trim());
                                    if (result) {
                                      Navigator.of(context).pushNamed('/mainAuthPage');
                                    }
                                  
                                },
                                child: const Text(
                                  'Proceed',
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                  Container(
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
                    
                ]),
                
          ),
          
        ))));
  }
}
