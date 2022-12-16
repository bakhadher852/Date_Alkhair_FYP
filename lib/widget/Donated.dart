// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names

import 'package:Data_alkhair/model/person.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Donated extends StatelessWidget {
  const Donated({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var AppbarHeight = AppBar().preferredSize.height;
    var history = Provider.of<Persons>(context);
    var HistoryList = history.History;
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsetsDirectional.all(15),
      height: height - AppbarHeight,
      width: width * 0.90,
      child: ListView.builder(
          itemBuilder: (context, i) => Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 7,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              color: Theme.of(context).canvasColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          HistoryList[i].name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //show dialog to confirm Donation
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Donated ${HistoryList[i].GB} GB'),
                          Container(
                              margin: const EdgeInsets.only(
                                right: 12,
                              ),
                              child: Text(HistoryList[i].Reason))
                        ],
                      )),
                  Container(
                      margin:
                          const EdgeInsets.only(right: 9, left: 9, bottom: 15),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //show the company name
                          Text(
                            HistoryList[i].company,
                            textAlign: TextAlign.end,
                          ), //show the phone number
                          Text(HistoryList[i].phoneNumber.toString()),
                          Padding(
                              padding: const EdgeInsets.only(right: 13),
                              //show the date of Request
                              child: Text(
                                'Today',
                                textAlign: TextAlign.end,
                              )),
                        ],
                      ))
                ],
              )),
          itemCount: history.History.length),
    );
  }
}
