import 'package:chat_app/model/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../firebase/firebase_utlis.dart';

class AuthUserProvider extends ChangeNotifier{
   MyUser ? currentUser;
   User ? firebaseUser;
  AuthUserProvider(){
    firebaseUser=FirebaseAuth.instance.currentUser;
    initUser();
  }
   initUser() async {
     if (firebaseUser != null) {
       try {
         currentUser = await FirebaseUtils.readUserFromFirestore(firebaseUser?.uid ?? "");
         notifyListeners();
       } catch (e) {
         print("Error initializing user: $e");
       }
     }
   }


}