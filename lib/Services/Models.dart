class UserData {
   String uid;
   String email;
   String fullName;
   String username;
   String address;
   String phone;
   String profilePicture;
   bool hasDoneSetup;
   bool isverified;
   bool hasDoneAccSetup;
   bool isEmailVerified;



  UserData(
      {required this.uid,
       this.email = "",     
       this.fullName = "",
       this.address = "",
       this.profilePicture = "",
       this.username = "",
       this.phone = "",
       this.hasDoneSetup = false,
       this.hasDoneAccSetup = false,
       this.isEmailVerified = false,
       this.isverified = false,
     });
}
