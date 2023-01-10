// ignore_for_file: constant_identifier_names, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  static const RouteName = '/RequestPage';
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  //Varibles has the value that user select
  double _currentSliderValue = 0;
  String? dropdownReasonValue;
  String? companyNameSelected;
  List<String> ReasonsList = [
    'For study ',
    'Social media',
    'Work purpose',
    'Others'
  ];
  List<String> CompanyName = ['Umobile', 'Maxis', 'XoX'];
  void validateUserInput(BuildContext context) {
    if (_currentSliderValue == 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Erorr... Enter amount of Data',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ));
      return;
    }
    if (companyNameSelected == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Erorr...Enter Sim Provider',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ));
      return;
    }
    if (dropdownReasonValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Erorr...Enter Your Reason',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Color.fromARGB(158, 152, 168, 226),
      content: Text(
        'Request Successful...',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
    ));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var AppbarHeight = AppBar().preferredSize.height;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).canvasColor,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: height * 0.21 - AppbarHeight,
            ),
            Container(
              color: Theme.of(context).canvasColor,
              height: height * 0.77 - AppbarHeight,
              width: width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.13),
                        child: Text(
                          'How much data you need',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      //data + icons
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'data',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        Row(
                          //has the add and minus icons
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (_currentSliderValue == 0) return;
                                  _currentSliderValue -= 0.5;
                                });
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                            Text(
                              '$_currentSliderValue GB',
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (_currentSliderValue == 5) return;
                                  _currentSliderValue += 0.5;
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Slider(
                    label: _currentSliderValue.toString(),
                    activeColor: Theme.of(context).primaryColorDark,
                    value: _currentSliderValue,
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                    max: 5,
                    divisions: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(159, 119, 181, 231),
                        ),
                      ),
                    ),
                    hint: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Select ...',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                    elevation: 20,
                    icon: Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    items: CompanyName.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        companyNameSelected = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(159, 119, 181, 231),
                        ),
                      ),
                    ),
                    hint: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Your Reason',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                    elevation: 20,
                    icon: Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    items: ReasonsList.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: 23,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropdownReasonValue = value!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).backgroundColor,
                    ),
                    onPressed: () {
                      validateUserInput(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Request',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                  )
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
          backgroundColor: Color.fromARGB(158, 152, 168, 226),
          radius: 95,
        ),
      ),
      const Positioned(
        top: 8,
        left: -80,
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(158, 152, 168, 226),
          radius: 95,
        ),
      ),
      Positioned(
          top: height * 0.16,
          left: 20,
          child: Material(
            child: Container(
              color: Color.fromARGB(158, 152, 168, 226),
              child: IconButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
                color: Theme.of(context).buttonColor,
              ),
            ),
          ))
    ]);
  }
}
