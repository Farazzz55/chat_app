
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_user_provider.dart';
import '../../firebase/firebase_utlis.dart';
import 'login_navigator.dart';


class LoginViewModel extends ChangeNotifier{
  late LoginNavigator navigator;
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   var formKey=GlobalKey<FormState>();
  void login(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      try {
        navigator.showMyLoading('Loading...');
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        var user = await FirebaseUtils.readUserFromFirestore(credential.user?.uid ?? '');
        if (user != null) {
          var authProvider = Provider.of<AuthUserProvider>(context, listen: false);
          authProvider.currentUser=user;
        }

        navigator.hideMyLoading();
        navigator.showMessega('Login Successfully');
      } on FirebaseAuthException catch (e) {
        navigator.hideMyLoading();
        if (e.code == 'user-not-found') {
          navigator.showMessega('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          navigator.showMessega('Wrong password provided for that user.');
        } else {
          navigator.showMessega(e.message ?? 'An error occurred.');
        }
      } catch (e) {
        navigator.hideMyLoading();
        navigator.showMessega('Error: ${e.toString()}');
      }
    }
  }
}