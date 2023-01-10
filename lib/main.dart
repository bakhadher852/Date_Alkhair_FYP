// ignore_for_file: prefer_const_constructors

import 'package:Data_alkhair/model/person.dart';
import 'package:Data_alkhair/screen/History.dart';
import 'package:Data_alkhair/screen/Home_page.dart';
import 'package:Data_alkhair/screen/RequestPage.dart';
import 'package:Data_alkhair/screen/donatePage.dart';
import 'package:Data_alkhair/screen/login.dart';
import 'package:Data_alkhair/screen/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
      create: (context) => Persons(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Khair Data sharing',
        theme: ThemeData(
          //for Sign up page text
          primaryColorDark: Colors.black,
          primarySwatch: Colors.blue,
          //home page button background color
          backgroundColor: Color.fromARGB(107, 91, 123, 238),
          //login button
          iconTheme: IconThemeData(color: Color.fromARGB(107, 91, 123, 238)),
          //Arrow Icon color ,going back arrow
          buttonColor: Color.fromARGB(255, 58, 59, 63),
          // Color(0xff0030DD)
          textTheme: TextTheme(
            labelMedium: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            //Login Page title
            headline1: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
            // fromRGBO(91, 123, 238, 1)
            //home page button text 3 button
            headline2: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              // Color(0xff0030DD)
            ),
            //for login page text in button
            button: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          // canvasColor: const Color(0xffC1CDED)
          canvasColor: Colors.white,
          // Color(0xffC1CDED)
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
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
      ),
    );
  }
}
