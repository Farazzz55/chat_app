import 'package:chat_app/model/my_user.dart';
import 'package:chat_app/ui/register/register_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_user_provider.dart';
import '../../firebase/firebase_utlis.dart';


class RegisterViewModel extends ChangeNotifier {
  late RegisterNavigator navigator;
   TextEditingController fullNameController = TextEditingController(text: 'farah');
   TextEditingController emailController = TextEditingController(text: 'farah@gmail.com');
   TextEditingController passwordController = TextEditingController(text: 'FarahEssam_123');
   TextEditingController ConfirmPasswordController = TextEditingController(text: 'FarahEssam_123');
  var formKey=GlobalKey<FormState>();


  // Register function to handle user registration
  Future<void> register(BuildContext context) async {
    if(formKey.currentState?.validate()==true){
    navigator.showMyLoading('Loading...');
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      MyUser myUser = MyUser(
        id: credential.user?.uid ?? '',
        userName: fullNameController.text,
        email: emailController.text,
      );

      var authProvider = Provider.of<AuthUserProvider>(context, listen: false);
      authProvider.currentUser=myUser;

      await FirebaseUtils.addUserToFirebase(myUser);
      print("User added to Firestore.");
      navigator.hideMyLoading();
      navigator.showMessega('Register Successfully');
      print('Register Success');


    } on FirebaseAuthException catch (e) {
      navigator.hideMyLoading();
      if (e.code == 'weak-password') {
        navigator.showMessega('The password provided is too weak');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        navigator.showMessega('The account already exists for that email');
        print('The account already exists for that email.');
      } else {
        navigator.showMessega('Error: ${e.message}');
        print('Error: ${e.message}');
      }

    } catch (e) {
      navigator.hideMyLoading();
      navigator.showMessega('Error: ${e.toString()}');
      print('Error: $e');
    }}
  }
}
