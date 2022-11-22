import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  static const RouteName = '/HistoryPage';
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'History',
            style: TextStyle(fontSize: 25),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            automaticIndicatorColorAdjustment: false,
            tabs: [
              Text(
                'Earned',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Donated',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Text('Earned'),
            Text('Donated'),
          ],
        ),
      ),
    );
  }
}
