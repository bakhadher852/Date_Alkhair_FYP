import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});
  static const RouteName = '/SignUpPage';

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

  @override
  Widget build(BuildContext context) {
    print(userEmail.text);
    print('=====================================');
    var AppbarHeight = AppBar().preferredSize.height;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //Name textFiled
    Widget buildName() => Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.04),
          child: TextField(
            controller: userName,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your name',
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
          ),
        );
    //Occupation textFiled
    Widget buildOccupation() => Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.04),
          child: TextField(
            controller: userEmail,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your occupation',
            ),
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
              border: UnderlineInputBorder(),
              labelText: 'Enter your email',
            ),
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
              labelText: 'Enter your password',
              border: UnderlineInputBorder(),
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
              labelText: 'Confirm your Password',
              border: UnderlineInputBorder(),
            ),
            obscureText: true,
          ),
        ); //Occupation textFiled
    Widget buildUserPhone() => Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.04),
          child: TextField(
            controller: userPhone,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your Mobile number',
              hintText: '011*******',
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
          ),
        );
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
                    padding: EdgeInsets.only(bottom: 9, top: height * 0.07),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Color.fromARGB(206, 33, 149, 243)),
                    ),
                  ),
                  buildName(),
                  buildOccupation(),
                  buildEmail(),
                  buildPassword(),
                  buildConfirmPassword(),
                  buildUserPhone()
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
    ]);
  }
}
