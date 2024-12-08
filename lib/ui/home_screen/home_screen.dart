import 'package:chat_app/ui/add_room/add_room.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  static String routeName='home_screen';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
         width: double.infinity,
         color: Colors.white,
          child:Image.asset('assets/images/background.png', width: double.infinity,
          fit: BoxFit.cover,)
          ,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
         appBar: AppBar(
           backgroundColor: Colors.transparent,
           title: Text('Chat App', style: GoogleFonts.poppins(
    textStyle: Theme.of(context).textTheme.titleLarge,
    ),),
           centerTitle: true,
         ),
          floatingActionButton: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AddRoom.routeName);
            },
            child: Container(
              width:MediaQuery.of(context).size.width*0.2,
              height: MediaQuery.of(context).size.height*0.1,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white, // Icon color
              ),
            ),
          ),


        )
      ],
    );
  }
}
