// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:Data_alkhair/screen/signUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //short cut
    buildTitleText(String text) => Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Color.fromRGBO(91, 123, 238, 1)),
        );
    return Stack(children: [
      Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xffC1CDED),
          ),
          body: SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              //to avoid keyboard bottom overflow
              child: Column(
                children: [
                  //To make some space from the Top
                  SizedBox(
                    height: height * 0.16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.17),
                    child: buildTitleText('DATA'),
                  ),
                  buildTitleText('Al-Khair'),
                  Padding(
                    padding: EdgeInsets.all(width * 0.10),
                    child: const TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'Mobile Number '),
                    ),
                  ),
                  //Button LOGIN with OTP
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(85, 60, 99, 239),
                          elevation: 7),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.16),
                        child: const Text('LOGIN with OTP',
                            style: TextStyle(
                                color: Color.fromARGB(160, 0, 0, 0),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(25, 60, 99, 239),
                          elevation: 7),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.16),
                        child: const Text('LOGIN with Email',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.04),
                    child: RichText(
                      text: TextSpan(
                        text: "Haven't Register? ",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign Up',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context)
                                    .pushNamed(SignUp.RouteName)),
                          const TextSpan(text: ' Now', style: TextStyle()),
                        ],
                      ),
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
          radius: 95,
        ),
      ),
      const Positioned(
        top: 8,
        left: -80,
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(184, 86, 117, 231),
          radius: 95,
        ),
      ),
    ]);
  }
}
