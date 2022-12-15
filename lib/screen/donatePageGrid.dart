// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, prefer_const_constructors_in_immutables, non_constant_identifier_names
import 'package:Data_alkhair/screen/donatePage.dart';
import 'package:flutter/material.dart';

class donatePageGrid extends StatefulWidget {
  donatePageGrid({
    Key? key,
    required this.name,
    required this.GB,
    required this.Reason,
    required this.date,
    required this.company,
    required this.phoneNumber,
  }) : super(key: key);
  final String name;
  final double GB;
  final String Reason;
  final String date;
  final String company;
  final int phoneNumber;

  @override
  State<donatePageGrid> createState() => _donatePageGridState();
}

class _donatePageGridState extends State<donatePageGrid> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                    widget.name,
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
                                  title: const Text('Confirm Donation'),
                                  content: const Text('Did you Donate data ?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  backgroundColor: Colors.blue,
                                                  content: Text(
                                                      'Thank You for Donation...',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17))));

                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Yes')),
                                    TextButton(
                                        onPressed: () {
                                          //in case press No no thing will happen
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('No'))
                                  ],
                                ));
                      },
                      child: const Text(
                        'Confirm Donation ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Need ${widget.GB} GB'),
                    Container(
                        margin: const EdgeInsets.only(
                          right: 12,
                        ),
                        child: Text(widget.Reason))
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(right: 9, left: 9, bottom: 15),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //show the company name
                    Text(
                      widget.company,
                      textAlign: TextAlign.end,
                    ), //show the phone number
                    Text(widget.phoneNumber.toString()),
                    Padding(
                        padding: const EdgeInsets.only(right: 13),
                        //show the date of Request
                        child: Text(
                          widget.date,
                          textAlign: TextAlign.end,
                        )),
                  ],
                ))
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
