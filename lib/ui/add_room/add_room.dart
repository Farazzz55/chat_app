import 'package:chat_app/model/category.dart';
import 'package:chat_app/widget/CustomElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRoom extends StatefulWidget {
  static String routeName = 'add_room';

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {
  String roomTitle = '';
  String desc = '';
  Category? selectedItem;
  List<Category> categoryList = Category.getCategory();
  var formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Image.asset(
            'assets/images/background.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Chat App',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.black38,
                  width: 3,
                ),
              ),
              width: screenWidth * 0.8,
              height: screenHeight * 0.8,
              padding: EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        'Create New Room',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Image.asset(
                        'assets/images/group.png',
                        width: screenWidth * 0.5,
                        height: screenHeight * 0.2,
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      TextFormField(
                        onChanged: (text) {
                          roomTitle = text;
                        },
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Enter Room Title';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Room Name',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DropdownButton<Category>(
                              hint: Text('Select Category'),
                              value: selectedItem,
                              items: categoryList.map((category) {
                                return DropdownMenuItem<Category>(
                                  value: category,
                                  child: Row(
                                    children: [
                                      Text(category.title),
                                      SizedBox(width: 10),
                                      Image.asset(category.image, width: screenWidth*0.05, height: screenHeight*0.5),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (newCategory) {
                                setState(() {
                                  selectedItem = newCategory;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Room Description',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                        onChanged: (text) {
                          desc = text;
                        },
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Enter Room Description';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      CustomElevatedButton(label: 'Add Room', onTap: (){
                        validateFormKey();
                      }, backgroundColor: Colors.blue,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15
                      ) ,)

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void validateFormKey() {
    if(formKey.currentState?.validate()==true){

    }
  }
}
