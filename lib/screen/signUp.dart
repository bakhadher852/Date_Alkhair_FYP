// ignore_for_file: constant_identifier_names

import 'package:Data_alkhair/widget/string_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Home_page.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});
  static const RouteName = '/SignUpPage';
  final userName = TextEditingController();
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final userName = TextEditingController();
  final userOccupation = TextEditingController();
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  final userPhone = TextEditingController();
  bool checkBoxValu = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // print(width * 0.25);
    // print('=====================================');

    //short cut Color
    Color buildColor() => Theme.of(context).primaryColorDark;
    //short cut UnderLineBorder
    InputBorder buildUnderLineBorder() => UnderlineInputBorder(
          borderSide: BorderSide(color: buildColor()),
        );
    //short cut labelStyle
    TextStyle buildlabelStyle() => TextStyle(
          fontWeight: FontWeight.bold,
          color: buildColor(),
        );

    //short cut hintStyle
    TextStyle buildHintStyle() => TextStyle(
          fontSize: 12,
          color: buildColor(),
        );

    //short cut UnderLineBorder
    buildTextInputAction() => TextInputAction.done;
    //short cut padding
    buildPadding() => EdgeInsets.symmetric(horizontal: height * 0.04);
    //short cut errorSnackBarMeassage
    builderrorSnackBarMeassage(String message) =>
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(message,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 17))));
    //short cut TextFieldDecoration
    // ignore: non_constant_identifier_names
    builTextFieldDecoration(String Hint, String Lable) => InputDecoration(
        enabledBorder: buildUnderLineBorder(),
        hintText: Hint,
        labelText: Lable,
        labelStyle: buildlabelStyle(),
        hintStyle: buildHintStyle(),
        focusColor: buildColor());

    //Name textFiled
    Widget buildName() => Padding(
          padding: buildPadding(),
          child: TextField(
            controller: userName,
            decoration: builTextFieldDecoration('Enter your name', 'Name'),
            keyboardType: TextInputType.name,
            textInputAction: buildTextInputAction(),
          ),
        );
    //Occupation textFiled
    Widget buildOccupation() => Padding(
          padding: buildPadding(),
          child: TextField(
            controller: userOccupation,
            decoration:
                builTextFieldDecoration('Enter your occupation', 'Occupation'),
            keyboardType: TextInputType.text,
            textInputAction: buildTextInputAction(),
          ),
        );
    //Email textFiled
    Widget buildEmail() => Padding(
          padding: buildPadding(),
          child: TextField(
            controller: userEmail,
            decoration: builTextFieldDecoration('Enter your email', 'Email'),
            keyboardType: TextInputType.emailAddress,
            textInputAction: buildTextInputAction(),
          ),
        );
    //Password textFiled
    Widget buildPassword() => Padding(
          padding: buildPadding(),
          child: TextField(
            controller: userPassword,
            decoration:
                builTextFieldDecoration('Enter your password', 'Password'),
            obscureText: true,
          ),
        );
    //Password textFiled
    Widget buildConfirmPassword() => Padding(
          padding: buildPadding(),
          child: TextField(
            controller: confirmPassword,
            decoration: builTextFieldDecoration(
                'Confirm your password', 'Confirm Password'),
            obscureText: true,
          ),
        ); //Occupation textFiled
    Widget buildUserPhone() => Padding(
          padding: buildPadding(),
          child: TextField(
            controller: userPhone,
            decoration: builTextFieldDecoration('011*******', 'Mobile number'),
            keyboardType: TextInputType.number,
            textInputAction: buildTextInputAction(),
          ),
        );
    // ignore: non_constant_identifier_names
    void Validation() {
      //Name validation
      if ((userName.text).isWhitespace()) {
        builderrorSnackBarMeassage('Enter a valid name...');
        return;
      }
      //Occupation validation
      if ((userOccupation.text).isWhitespace()) {
        builderrorSnackBarMeassage('Enter a valid Occupation...');
        return;
      }
      //Email Validation
      if (!(userEmail.text).isValidEmail()) {
        builderrorSnackBarMeassage('Enter a valid email...');
        return;
      }
      // Password validation
      if ((userPassword.text).isWhitespace()) {
        builderrorSnackBarMeassage('Enter a valid password...');
        return;
      }
      // Confirm Password validation
      if ((userPassword.text) != (confirmPassword.text)) {
        builderrorSnackBarMeassage('Your password is not same');
        return;
      }
      //User phone number Validation
      if (!(userPhone.text).isValidInt() || (userPhone.text).length < 7) {
        builderrorSnackBarMeassage('Enter a valid number');
        return;
      }
      //User agreement on terms and conditions
      if (!checkBoxValu) {
        builderrorSnackBarMeassage('Agree to proceed');
        return;
      }
      //If all User input is valid go to app
      Navigator.pushNamed(context, HomePage.RouteName,
          arguments: userName.text);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const HomePage()),
      // );
    }

    //short cut
    Color? buildstackColor() => Theme.of(context).appBarTheme.backgroundColor;
    //short cut
    Widget buildCircleAvatar() => const CircleAvatar(
          backgroundColor: Color.fromARGB(158, 152, 168, 226),
          // backgroundColor: Color.fromARGB(184, 86, 117, 231)
          radius: 95,
        );

    return Stack(children: [
      Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: buildstackColor(),
          ),
          body: Container(
            color: buildstackColor(),
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 9, top: height * 0.18),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: buildColor()),
                    ),
                  ),
                  buildName(),
                  buildOccupation(),
                  buildEmail(),
                  buildPassword(),
                  buildConfirmPassword(),
                  buildUserPhone(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: height * 0.03),
                    child: Row(
                      children: [
                        Checkbox(
                            value: checkBoxValu,
                            onChanged: (value) {
                              setState(() {
                                checkBoxValu = value!;
                              });
                            }),
                        RichText(
                          text: TextSpan(
                            text: "I agree to all Statements in \n",
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Terms & Conditions',
                                style: TextStyle(color: buildColor()),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Sign up button to validate and go to App
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            Validation();
                          },
                          icon: Icon(
                            Icons.arrow_forward_outlined,
                            color: Theme.of(context).buttonColor,
                            size: 40,
                          )),
                    ),
                  )
                ],
              ),
            ),
          )),
      Positioned(
        top: -80,
        left: -10,
        //right: ,
        child: buildCircleAvatar(),
      ),
      Positioned(
        top: 8,
        left: -80,
        child: buildCircleAvatar(),
      ),
      Positioned(
        top: height * 0.16,
        left: 20,
        child: Material(
          child: Container(
            //back arrow button background color
            color: const Color.fromARGB(158, 152, 168, 226),
            child: IconButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                color: Theme.of(context).buttonColor,
                iconSize: 35),
          ),
        ),
      )
    ]);
  }
}
