import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  static const RouteName = '/RequestPage';
  RequestPage({super.key});

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
        body: ListView(
          children: [
            SizedBox(
              height: height * 0.21 - AppbarHeight,
            ),
            Container(
              color: const Color(0xffC1CDED),
              height: height * 0.77 - AppbarHeight,
              width: width,
              child: Column(
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
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(right: 25.0),
                        child: Text(
                          'How much data you need',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0030DD),
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
                        const Text(
                          'data',
                          style:
                              TextStyle(fontSize: 23, color: Color(0xff0030DD)),
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
                              icon: const Icon(
                                Icons.remove,
                                color: Color(0xff0030DD),
                              ),
                            ),
                            Text(
                              '$_currentSliderValue GB',
                              style: const TextStyle(
                                  fontSize: 22, color: Color(0xff0030DD)),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (_currentSliderValue == 5) return;
                                  _currentSliderValue += 0.5;
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Color(0xff0030DD),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Slider(
                    label: _currentSliderValue.toString(),
                    activeColor: Colors.blue,
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
                    hint: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Select ...',
                        style:
                            TextStyle(fontSize: 23, color: Color(0xff0030DD)),
                      ),
                    ),
                    elevation: 20,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined,
                        color: Color(0xff0030DD)),
                    items: CompanyName.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            value,
                            style: const TextStyle(
                                fontSize: 23, color: Color(0xff0030DD)),
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
                    hint: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Your Reason',
                        style:
                            TextStyle(fontSize: 23, color: Color(0xff0030DD)),
                      ),
                    ),
                    elevation: 20,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined,
                        color: Color(0xff0030DD)),
                    items: ReasonsList.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            value,
                            style: const TextStyle(
                                fontSize: 23, color: Color(0xff0030DD)),
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
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Request',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
    ]);
  }
}
