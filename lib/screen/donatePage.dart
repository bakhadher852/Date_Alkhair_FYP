// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

class DonatePage extends StatelessWidget {
  static const routeName = '/DonatePage';
  const DonatePage({super.key});

  @override
  Widget build(BuildContext context) {
    var AppbarHeight = AppBar().preferredSize.height;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffC1CDED),
        ),
        body: Column(
          children: [
            SizedBox(
              height: height * 0.21 - AppbarHeight,
            ),
            Container(
              color: const Color(0xffC1CDED),
              height: height * 0.77 - AppbarHeight,
              width: width,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: const Color(0xff0030DD),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          'Select a Person To Donate',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0030DD),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsetsDirectional.all(15),
                    height: height * 0.66 - AppbarHeight,
                    width: width * 0.90,
                    child: ListView(children: [
                      const SelectPersonCart(
                          name: 'Khalid',
                          GB: 'Need 1 GB',
                          Occupation: 'Student',
                          date: 'Today'),
                      const SelectPersonCart(
                          name: 'AbudlRahman',
                          GB: 'Need 2 GB',
                          Occupation: 'Student',
                          date: 'Today'),
                      const SelectPersonCart(
                          name: 'Fatima',
                          GB: 'Need 0.5 GB',
                          Occupation: 'Worker',
                          date: 'Today'),
                      const SelectPersonCart(
                          name: 'Layla',
                          GB: 'Need 2 GB',
                          Occupation: 'Driver',
                          date: 'Yesterday')
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

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
      // Positioned(
      //   top: 100,
      //   child: SizedBox(
      //     height: 50,
      //     width: width,
      //     child: Scaffold(
      //       appBar: AppBar(
      //           //backgroundColor: Color.fromARGB(203, 244, 67, 54),
      //           elevation: 0,
      //           automaticallyImplyLeading: true),
      //     ),
      //   ),
      // ),
    ]);
  }
}

class SelectPersonCart extends StatelessWidget {
  const SelectPersonCart({
    super.key,
    required this.name,
    required this.GB,
    required this.Occupation,
    required this.date,
  });
  final String name;
  final String GB;
  final String Occupation;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 7,
        margin: const EdgeInsets.only(top: 20),
        color: Theme.of(context).canvasColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                      onPressed: () {}, child: const Text('Prove Reason '))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(GB),
                  Container(
                      margin: const EdgeInsets.only(
                        right: 12,
                      ),
                      child: Text(Occupation))
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(right: 10, top: 10),
              child: Text(
                date,
                textAlign: TextAlign.end,
              ),
            )
          ],
        ));
  }
}

Widget ListViewBuilderBox(Widget child) {
  return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsetsDirectional.all(10),
      height: 150,
      width: 300,
      child: child);
}
