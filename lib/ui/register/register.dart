
import 'package:chat_app/ui/register/register_navigator.dart';
import 'package:chat_app/ui/register/register_view_model.dart';
import 'package:chat_app/widget/CustomElevatedButton.dart';
import 'package:chat_app/widget/CustomTextFormField.dart';
import 'package:chat_app/widget/dialog_utlis.dart';
import 'package:chat_app/widget/validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../home_screen/home_screen.dart';

class Register extends StatefulWidget {
  static String routeName = 'register_screen';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> implements RegisterNavigator{


  RegisterViewModel viewModel=RegisterViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        viewModel;
      },
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Image.asset(
              'assets/images/background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  'Create Account',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleLarge),
                ),
                elevation: 0,
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: viewModel.formKey,
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Full Name',
                                    style: GoogleFonts.inter(
                                      textStyle: Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ),
                                  CustomTextFormField(
                                    hintText: 'Full Name',
                                    validator: (fullName) {
                                      return AppValidator.validateFullName(fullName);
                                    },
                                    controller: viewModel.fullNameController,
                                  ),
                                  SizedBox(
                                    height:
                                    MediaQuery.of(context).size.height * 0.01,
                                  ),
                                  Text(
                                    'Email',
                                    style: GoogleFonts.inter(
                                      textStyle: Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ),
                                  CustomTextFormField(
                                    hintText: 'Email',
                                    validator: (email) {
                                      return AppValidator.validateEmail(email);
                                    },
                                    controller: viewModel.emailController,
                                  ),
                                  SizedBox(
                                    height:
                                    MediaQuery.of(context).size.height * 0.01,
                                  ),
                                  Text(
                                    'Password',
                                    style: GoogleFonts.inter(
                                      textStyle: Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ),
                                  CustomTextFormField(
                                    hintText: 'Password',
                                    obscureText: true,
                                    validator: (password) {
                                      return AppValidator.validatePassword(password);
                                    },
                                    controller: viewModel.passwordController,
                                  ),
                                  SizedBox(
                                    height:
                                    MediaQuery.of(context).size.height * 0.01,
                                  ),
                                  Text(
                                    'Confirm Password',
                                    style: GoogleFonts.inter(
                                      textStyle: Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ),
                                  CustomTextFormField(
                                    hintText: 'Confirm Password',
                                    obscureText: true,
                                    validator: (confirmPassword) {
                                      return AppValidator.validateConfirmPassword(confirmPassword,viewModel.passwordController.text);
                                    },
                                    controller: viewModel.ConfirmPasswordController,
                                  ),
                                  SizedBox(
                                    height:
                                    MediaQuery.of(context).size.height * 0.05,
                                  ),
                                  CustomElevatedButton(
                                    label: 'Create Account',
                                    onTap: () {
                                        viewModel.register(context);
                                      },
                                    backgroundColor: Colors.blue,
                                    textStyle:
                                    Theme.of(context).textTheme.titleLarge,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              )),
        ],
      ),
    );
  }
  @override
  void hideMyLoading() {
    DialogUtlis.hideLoading(context);
  }

  @override
  void showMessega(String message) {
    DialogUtlis.showMessege(context: context, content: message , ButtonOneName: 'OK',
        ButtonOne: (){
          if(message=='Register Successfully'){
            Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
          }else{
            Navigator.pop(context);
          }
        }
    );
  }

  @override
  void showMyLoading(String message) {
    DialogUtlis.showLoading(context: context, messege: message);
  }
}
