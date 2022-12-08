import 'package:date_alkhair/widget/string_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Home_page.dart';
import 'donatePage.dart';

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
    // print(userEmail.text);
    // print('=====================================');
    var AppbarHeight = AppBar().preferredSize.height;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //Name textFiled
    Widget buildName() => Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.04),
          child: TextField(
            controller: userName,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(91, 123, 238, 1)),
                ),
                hintText: 'Enter your name',
                labelText: 'Name',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(91, 123, 238, 1),
                ),
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(91, 123, 238, 1),
                ),
                focusColor: Color.fromRGBO(91, 123, 238, 1)),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
          ),
        );
    //Occupation textFiled
    Widget buildOccupation() => Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.04),
          child: TextField(
            controller: userOccupation,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(91, 123, 238, 1)),
                ),
                hintText: 'Enter your occupation',
                labelText: 'Occupation',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(91, 123, 238, 1),
                ),
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(91, 123, 238, 1),
                ),
                focusColor: Color.fromRGBO(91, 123, 238, 1)),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
          ),
        );
    //Email textFiled
    Widget buildEmail() => Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.04),
          child: TextField(
            controller: userEmail,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(91, 123, 238, 1)),
                ),
                hintText: 'Enter your email',
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(91, 123, 238, 1),
                ),
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(91, 123, 238, 1),
                ),
                focusColor: Color.fromRGBO(91, 123, 238, 1)),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
          ),
        );
    //Password textFiled
    Widget buildPassword() => Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.04),
          child: TextField(
            controller: userPassword,
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(91, 123, 238, 1),
              ),
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(91, 123, 238, 1),
              ),
              focusColor: Color.fromRGBO(91, 123, 238, 1),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(91, 123, 238, 1)),
              ),
            ),
            obscureText: true,
          ),
        );
    //Password textFiled
    Widget buildConfirmPassword() => Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.04),
          child: TextField(
            controller: confirmPassword,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
              hintText: 'Confirm your password',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(91, 123, 238, 1),
              ),
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(91, 123, 238, 1),
              ),
              focusColor: Color.fromRGBO(91, 123, 238, 1),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(91, 123, 238, 1)),
              ),
            ),
            obscureText: true,
          ),
        ); //Occupation textFiled
    Widget buildUserPhone() => Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.04),
          child: TextField(
            controller: userPhone,
            decoration: const InputDecoration(
              fillColor: Color.fromRGBO(91, 123, 238, 1),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(91, 123, 238, 1)),
              ),
              labelText: 'Mobile number',
              focusColor: Color.fromRGBO(91, 123, 238, 1),
              hintText: '011*******',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(91, 123, 238, 1),
              ),
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(91, 123, 238, 1),
              ),
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
          ),
        );
    void Validation() {
      //Name validation
      if ((userName.text).isWhitespace()) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Enter a valid name...',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))));
        return;
      }
      //Occupation validation
      if ((userOccupation.text).isWhitespace()) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Enter a valid Occupation...',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))));
        return;
      }
      //Email Validation
      if (!(userEmail.text).isValidEmail()) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Enter a valid email...',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))));
        return;
      }
      // Password validation
      if ((userPassword.text).isWhitespace()) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Enter a valid password...',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))));
        return;
      }
      // Confirm Password validation
      if ((userPassword.text) != (confirmPassword.text)) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Your password is not same',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))));
        return;
      }
      //User phone number Validation
      if (!(userPhone.text).isValidInt() || (userPhone.text).length < 7) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Enter a valid number',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))));
        return;
      }
      //User agreement on terms and conditions
      if (!checkBoxValu) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Agree to proceed',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))));
        return;
      }
      //If all User input is valid go to app
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }

    return Stack(children: [
      Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xffC1CDED),
          ),
          body: Container(
            color: const Color(0xffC1CDED),
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 9, top: height * 0.18),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Color.fromRGBO(91, 123, 238, 1)),
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
                            text: "I agree to all Statements in ",
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Terms & Conditions',
                                style: const TextStyle(
                                    color: Color.fromRGBO(91, 123, 238, 1)),
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
                          icon: const Icon(
                            Icons.arrow_forward_outlined,
                            color: Color(0xff0030DD),
                            size: 40,
                          )),
                    ),
                  )
                ],
              ),
            ),
          )),
      const Positioned(
        top: -80,
        left: -10,
        //right: ,
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(184, 86, 117, 231),
          radius: 105,
        ),
      ),
      const Positioned(
        top: 8,
        left: -80,
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(184, 86, 117, 231),
          radius: 105,
        ),
      ),
      Positioned(
          top: height * 0.16,
          left: 20,
          child: Material(
            child: Container(
              color: const Color.fromARGB(184, 86, 117, 231),
              child: IconButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                color: const Color(0xff0030DD),
              ),
            ),
          ))
    ]);
  }
}
