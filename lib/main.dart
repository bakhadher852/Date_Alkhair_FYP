// ignore_for_file: prefer_const_constructors

import 'package:Data_alkhair/screen/History.dart';
import 'package:Data_alkhair/screen/Home_page.dart';
import 'package:Data_alkhair/screen/RequestPage.dart';
import 'package:Data_alkhair/screen/donatePage.dart';
import 'package:Data_alkhair/screen/login.dart';
import 'package:Data_alkhair/screen/signUp.dart';
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
        '/': (context) => Login(),
        DonatePage.RouteName: (_) => DonatePage(),
        RequestPage.RouteName: (_) => RequestPage(),
        HistoryPage.RouteName: (_) => HistoryPage(),
        SignUp.RouteName: (_) => SignUp(),
        HomePage.RouteName: (_) => HomePage(),
      },
    );
  }
}
