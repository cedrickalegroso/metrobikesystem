
import 'package:flutter/material.dart';


class UserData {
   String uid;
   String email;
   String fullName;
   String username;
   String address;
   bool hasDoneSetup;
   bool isverified;



  UserData(
      {required this.uid,
       this.email = "",     
       this.fullName = "",
       this.address = "",
       this.username = "",
       this.hasDoneSetup = false,
       this.isverified = false,
     });
}
