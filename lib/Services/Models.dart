
import 'package:flutter/material.dart';


class UserData {
   String uid;
   String email;
   String fullName;
   String username;
   String address;
   int hasDoneSetup;
   int isverified;



  UserData(
      {required this.uid,
       this.email = "",     
       this.fullName = "",
       this.address = "",
       this.username = "",
       this.hasDoneSetup = 0,
       this.isverified = 0,
     });
}
