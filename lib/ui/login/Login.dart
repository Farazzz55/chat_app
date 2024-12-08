import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../widget/CustomElevatedButton.dart';
import '../../widget/CustomTextFormField.dart';
import '../../widget/dialog_utlis.dart';
import '../../widget/validator.dart';
import '../home_screen/home_screen.dart';
import '../register/register.dart';

import 'login_navigator.dart';
import 'login_view_model.dart';

class Login extends StatefulWidget {
  static String routeName = 'login_screen';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> implements LoginNavigator {
  final LoginViewModel viewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this; // Assign the navigator here
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel, // Properly provide viewModel here
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
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Login',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            body: Form(
              key: viewModel.formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                height: MediaQuery.of(context).size.height * 0.01,
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
                                height: MediaQuery.of(context).size.height * 0.01,
                              ),
                              InkWell(
                                onTap: () {
                                  // Add forget password functionality
                                },
                                child: Text(
                                  'Forget Password?',
                                  style: GoogleFonts.inter(
                                    textStyle: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.04,
                              ),
                              CustomElevatedButton(
                                label: 'Login',
                                onTap: () {
                                  viewModel.login(context);
                                },
                                backgroundColor: Colors.blue,
                                textStyle: Theme.of(context).textTheme.titleLarge,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.04,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(Register.routeName);
                                },
                                child: Center(
                                  child: Text(
                                    'Create Account',
                                    style: GoogleFonts.inter(
                                      textStyle: Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
    DialogUtlis.showMessege(
      context: context,
      content: message,
      ButtonOne: () {
        if (message == 'Login Successfully') {
          Navigator.of(context).pushNamedAndRemoveUntil(
            HomeScreen.routeName,
                (route) => false,
          );
        } else {
          Navigator.pop(context);
        }
      },
      ButtonOneName: 'OK',
    );
  }

  @override
  void showMyLoading(String message) {
    DialogUtlis.showLoading(context: context, messege: message);
  }
}
