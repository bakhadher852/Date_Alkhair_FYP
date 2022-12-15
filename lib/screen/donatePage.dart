// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'donatePageGrid.dart';

enum FilterOptions { All, Umobile, XoX, Maxis }

class DonatePage extends StatefulWidget {
  static const RouteName = '/DonatePage';
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  List pepolListFiltered = [];
  static const List pepolList = [
    {
      'id': 1,
      'company': 'Umobile',
      'name': 'Khalid',
      'Reason': 'For study',
      'GB': 2.0,
      'date': 'Today',
      'phoneNumber': 01162332707
    },
    {
      'id': 2,
      'company': 'Umobile',
      'name': 'Farah ',
      'Reason': 'Work purpose',
      'GB': 0.5,
      'date': 'Today',
      'phoneNumber': 01162332101
    },
    {
      'id': 3,
      'company': 'Umobile',
      'name': 'Muaz ',
      'Reason': 'Others',
      'GB': 1.5,
      'date': 'Yesterday',
      'phoneNumber': 01162332202
    },
    {
      'id': 4,
      'company': 'Umobile',
      'name': 'Jalal ',
      'Reason': 'Others',
      'GB': 1.0,
      'date': 'Yesterday',
      'phoneNumber': 01162332505
    },
    {
      'id': 5,
      'company': 'Maxis',
      'name': 'Hajar ',
      'Reason': 'For study',
      'GB': 1.0,
      'date': 'Today',
      'phoneNumber': 01162332454
    },
    {
      'id': 6,
      'company': 'Maxis',
      'name': 'Murad ',
      'Reason': 'Social media',
      'GB': 0.5,
      'date': 'Today',
      'phoneNumber': 01162332789
    },
    {
      'id': 7,
      'company': 'Maxis',
      'name': 'Husna ',
      'Reason': 'Others',
      'GB': 1.0,
      'date': 'Yesterday',
      'phoneNumber': 01162332025
    },
    {
      'id': 8,
      'company': 'Maxis',
      'name': 'Marwan ',
      'Reason': 'Work purpose',
      'GB': 1.0,
      'date': 'Today',
      'phoneNumber': 01162332700
    },
    {
      'id': 9,
      'company': 'XoX',
      'name': 'Iffat ',
      'Reason': 'For study',
      'GB': 2.0,
      'date': 'Today',
      'phoneNumber': 01162332000
    },
  ];
  bool showAllPepol = false;
  bool showUmobileOnlyPepol = false;
  bool showMaxisOnlyPepol = false;
  bool showXoXOnlyPepol = false;

  @override
  //in the begining the pepolListFiltered = pepolList;
  void initState() {
    pepolListFiltered = pepolList;
    super.initState();
  }

  // ---------------------------------------------
  void showAllPepolTrueSetter() {
    setState(() {
      showUmobileOnlyPepol = false;
      showMaxisOnlyPepol = false;
      showXoXOnlyPepol = false;
      showAllPepol = true;
    });
  }

  void showUmobileOnlyPepolTrueSetter() {
    setState(() {
      showAllPepol = false;
      showMaxisOnlyPepol = false;
      showXoXOnlyPepol = false;
      showUmobileOnlyPepol = true;
    });
  }

  void showMaxisOnlyPepolTrueSetter() {
    setState(() {
      showAllPepol = false;
      showUmobileOnlyPepol = false;
      showXoXOnlyPepol = false;
      showMaxisOnlyPepol = true;
    });
  }

  void showXoXOnlyPepolTrueSetter() {
    setState(() {
      showAllPepol = false;
      showUmobileOnlyPepol = false;
      showMaxisOnlyPepol = false;
      showXoXOnlyPepol = true;
    });
  }

  // ----------------------------------------
  //this list to return the person base on the fillter

  @override
  Widget build(BuildContext context) {
    var UmobileList =
        pepolList.where((element) => element['company'] == 'Umobile').toList();
    var MaxisList =
        pepolList.where((element) => element['company'] == 'Maxis').toList();
    var XoXList =
        pepolList.where((element) => element['company'] == 'XoX').toList();

    void filteredPepol() {
      if (showAllPepol) {
        setState(() {
          pepolListFiltered = pepolList;
        });
      } else if (showUmobileOnlyPepol) {
        setState(() {
          pepolListFiltered = UmobileList;
        });
      } else if (showMaxisOnlyPepol) {
        setState(() {
          pepolListFiltered = MaxisList;
        });
      } else if (showXoXOnlyPepol) {
        setState(() {
          pepolListFiltered = XoXList;
        });
      }
    }

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
                      const Padding(
                        padding: EdgeInsets.only(right: 0.0),
                        child: Text(
                          'Select a Person To Donate',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0030DD),
                          ),
                        ),
                      ),
                      PopupMenuButton(
                        onSelected: (FilterOptions selectedValue) {
                          setState(() {
                            if (selectedValue == FilterOptions.All) {
                              // _showOnlyFavorites = true;
                              showAllPepolTrueSetter();
                              filteredPepol();
                            }
                            if (selectedValue == FilterOptions.Umobile) {
                              // _showOnlyFavorites = true;
                              showUmobileOnlyPepolTrueSetter();
                              filteredPepol();
                            }
                            if (selectedValue == FilterOptions.XoX) {
                              // _showOnlyFavorites = true;
                              showXoXOnlyPepolTrueSetter();
                              filteredPepol();
                            }
                            if (selectedValue == FilterOptions.Maxis) {
                              // _showOnlyFavorites = true;
                              showMaxisOnlyPepolTrueSetter();
                              filteredPepol();
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.more_vert,
                          color: Color(0xff0030DD),
                        ),
                        itemBuilder: (_) => [
                          const PopupMenuItem(
                            value: FilterOptions.All,
                            child: Text('All'),
                          ),
                          const PopupMenuItem(
                            value: FilterOptions.Umobile,
                            child: Text('Umobile'),
                          ),
                          const PopupMenuItem(
                            value: FilterOptions.XoX,
                            child: Text('XoX'),
                          ),
                          const PopupMenuItem(
                            value: FilterOptions.Maxis,
                            child: Text('Maxis'),
                          ),
                        ],
                      ),
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
                    child: ListView.builder(
                        itemBuilder: (context, i) => donatePageGrid(
                            phoneNumber: pepolListFiltered[i]['phoneNumber'],
                            Reason: pepolListFiltered[i]['Reason'],
                            company: pepolListFiltered[i]['company'],
                            date: pepolListFiltered[i]['date'],
                            name: pepolListFiltered[i]['name'],
                            GB: pepolListFiltered[i]['GB']),
                        itemCount: pepolListFiltered.length),
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
      Positioned(
          top: height * 0.16,
          left: 20,
          child: Material(
            child: Container(
              color: const Color.fromARGB(184, 86, 117, 231),
              child: IconButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                color: const Color(0xff0030DD),
              ),
            ),
          ))
    ]);
  }
}
