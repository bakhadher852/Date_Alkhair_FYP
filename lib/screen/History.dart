// ignore_for_file: file_names, constant_identifier_names

import 'package:flutter/material.dart';

import '../widget/Donated.dart';
import '../widget/Earned.dart';

class HistoryPage extends StatelessWidget {
  static const RouteName = '/HistoryPage';
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          //change the back button color
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
          title: Text(
            'History',
            style: TextStyle(
              fontSize: 25,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          bottom: TabBar(
            indicatorColor: Color.fromARGB(137, 0, 0, 0),
            indicatorWeight: 3,
            automaticIndicatorColorAdjustment: false,
            tabs: [
              Text(
                'Donated',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              Text(
                'Earned',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Donated(),
            Earned(),
          ],
        ),
      ),
    );
  }
}
