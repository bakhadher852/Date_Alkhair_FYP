// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names, annotate_overrides
// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/person.dart';

enum FilterOptions { All, Umobile, XoX, Maxis }

class DonatePage extends StatefulWidget {
  static const RouteName = '/DonatePage';
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  //this list to return the person base on the fillter
  void initState() {
    //if i delete , listen: false will not work the list
    final list = Provider.of<Persons>(context, listen: false);
//in the begining the pepolListFiltered = pepolList;
    list.pepolListFiltered = list.pepolList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<Persons>(context);
    var FList = list.pepolListFiltered;

    // print(
    //     '======================pepolListFiltered===============================');
    // print(FList.length);

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
                              list.All();
                            }
                            if (selectedValue == FilterOptions.Umobile) {
                              list.UmobileList();
                            }
                            if (selectedValue == FilterOptions.XoX) {
                              list.XoXList();
                            }
                            if (selectedValue == FilterOptions.Maxis) {
                              list.MaxisList();
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
                    padding: EdgeInsetsDirectional.all(15),
                    height: height * 0.66 - AppbarHeight,
                    width: width * 0.90,
                    child: ListView.builder(
                        itemBuilder: (context, i) {
                          return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 7,
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              color: Theme.of(context).canvasColor,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FList[i].name,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        //show dialog to confirm Donation
                                        TextButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) => AlertDialog(
                                                        title: const Text(
                                                            'Confirm Donation'),
                                                        content: const Text(
                                                            'Did you Donate data ?'),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .blue,
                                                                    content: Text(
                                                                        'Thank You for Donation...',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontSize: 17))));
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                // var ind =
                                                                //     FList[i].id;
                                                                list.deletePerosn(
                                                                    i);
                                                              },
                                                              child: const Text(
                                                                  'Yes')),
                                                          TextButton(
                                                              onPressed: () {
                                                                //in case press No no thing will happen
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: const Text(
                                                                  'No'))
                                                        ],
                                                      ));
                                            },
                                            child: const Text(
                                              'Confirm Donation ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Need ${FList[i].GB} GB'),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                right: 12,
                                              ),
                                              child: Text(FList[i].Reason))
                                        ],
                                      )),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          right: 9, left: 9, bottom: 15),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //show the company name
                                          Text(
                                            FList[i].company,
                                            textAlign: TextAlign.end,
                                          ), //show the phone number
                                          Text(FList[i].phoneNumber.toString()),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 13),
                                              //show the date of Request
                                              child: Text(
                                                FList[i].date,
                                                textAlign: TextAlign.end,
                                              )),
                                        ],
                                      ))
                                ],
                              ));
                        },
                        itemCount: FList.isEmpty ? 0 : FList.length),
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
