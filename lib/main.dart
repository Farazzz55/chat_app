import 'dart:io';

import 'package:chat_app/provider/auth_user_provider.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:chat_app/ui/add_room/add_room.dart';
import 'package:chat_app/ui/home_screen/home_screen.dart';
import 'package:chat_app/ui/login/Login.dart';
import 'package:chat_app/ui/register/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    runApp(
           ChangeNotifierProvider(
             create: (context)=>AuthUserProvider(),
               child: MyApp()),

    );  } catch (e) {
    print('Error initializing Firebase: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var userProvider=Provider.of<AuthUserProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       routes: {
         Login.routeName:(context)=>Login(),
         Register.routeName:(context)=>Register(),
         HomeScreen.routeName:(context)=>HomeScreen(),
         AddRoom.routeName:(context)=>AddRoom()
       },
      initialRoute: userProvider.firebaseUser==null? Login.routeName:HomeScreen.routeName,
      theme: AppTheme.appTheme,
    );
  }
}


