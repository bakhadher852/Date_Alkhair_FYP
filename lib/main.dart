// ignore_for_file: prefer_const_constructors

import 'package:date_alkhair/screen/History.dart';
import 'package:date_alkhair/screen/Home_page.dart';
import 'package:date_alkhair/screen/RequestPage.dart';
import 'package:date_alkhair/screen/donatePage.dart';
import 'package:date_alkhair/screen/login.dart';
import 'package:date_alkhair/screen/signUp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Al Kkair ',
      theme: ThemeData(
        iconTheme: IconThemeData(size: 30, color: Colors.white70),
        textTheme: TextTheme(
          labelMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(182, 255, 255, 255),
          ),
        ),
        //primarySwatch: ,
        //canvasColor: ,

        //primaryColor: const Color.fromRGBO(91, 123, 238, 1),
        canvasColor: const Color(0xffC1CDED),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(91, 123, 238, 1), elevation: 5),
      ),
      //home: const HomePage(),
      routes: {
        '/': (context) => HomePage(),
        DonatePage.RouteName: (_) => DonatePage(),
        RequestPage.RouteName: (_) => RequestPage(),
        HistoryPage.RouteName: (_) => HistoryPage(),
        SignUp.RouteName: (_) => SignUp(),
        HomePage.RouteName: (_) => HomePage(),
      },
    );
  }
}



// going back button


      // Positioned(
      //     top: height * 0.16,
      //     left: 20,
      //     child: Material(
      //       child: Container(
      //         color: Color.fromARGB(184, 86, 117, 231),
      //         child: IconButton(
      //           style: ElevatedButton.styleFrom(),
      //           onPressed: () {},
      //           icon: Icon(Icons.arrow_back),
      //           color: Color.fromARGB(255, 7, 65, 113),
      //         ),
      //       ),
      //     ))