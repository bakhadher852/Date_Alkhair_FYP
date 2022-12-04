// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:date_alkhair/screen/donatePage.dart';
import 'package:flutter/material.dart';

import '../widget/MySearchDelegate.dart';
import 'History.dart';
import 'RequestPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(children: [
      Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.27),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.2,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=389&q=80',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(
                            'Welcome Sara \n in Data Al-Khair',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(182, 255, 255, 255),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            '200',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        )
                      ],
                    )
                  ])),
        ),
        body: Container(
          width: width,
          height: height * 73,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: width * 0.85,
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    child: TextField(
                      keyboardType: TextInputType.none,
                      showCursor: false,
                      onTap: () {
                        showSearch(
                            context: context, delegate: MySearchDelegate());
                      },
                      style: const TextStyle(color: Colors.black, fontSize: 22),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(fontSize: 20),
                        hintText: 'Search ',
                        suffixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 40),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DonatePage(),
                          ),
                        );
                      },
                      child: Text(
                        'Donate data',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0030DD),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff8FA4ED),
                        fixedSize: Size(width * 0.75, height * 0.08),
                        alignment: Alignment.center,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RequestPage.RouteName);
                      },
                      child: Text(
                        'Request data',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0030DD),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff8FA4ED),
                        fixedSize: Size(width * 0.75, height * 0.08),
                        alignment: Alignment.center,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(HistoryPage.RouteName);
                      },
                      child: Text(
                        'My History',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0030DD),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff8FA4ED),
                        fixedSize: Size(width * 0.75, height * 0.08),
                        alignment: Alignment.center,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      Positioned(
        top: -80,
        left: -10,
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(163, 170, 187, 250),
          radius: 105,
        ),
      ),
      Positioned(
        top: 8,
        left: -80,
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(163, 170, 187, 250),
          radius: 105,
        ),
      ),
    ]);
  }
}
