// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/cupertino.dart';

class Earned extends StatelessWidget {
  const Earned({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height * 0.66,
        width: width * 0.90,
        child: Center(
            child: Text(
          "Not Yet",
          style: TextStyle(
            fontSize: 25,
          ),
        )));
  }
}
