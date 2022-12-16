// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

class Person {
  final int id;
  final String company;
  final String name;
  final String Reason;
  final double GB;
  final String date;
  final int phoneNumber;

  Person(
      {required this.Reason,
      required this.id,
      required this.company,
      required this.name,
      required this.GB,
      required this.date,
      required this.phoneNumber});
}

class Persons with ChangeNotifier {
  List pepolListFiltered = [];
  List History = [];

  List<Person> pepolList = [
    Person(
        id: 1,
        company: 'Umobile',
        name: 'Khalid',
        Reason: 'For study',
        GB: 2.0,
        date: 'Today',
        phoneNumber: 01162332707),
    Person(
        id: 2,
        company: 'Umobile',
        name: 'Farah ',
        Reason: 'Work purpose',
        GB: 0.5,
        date: 'Today',
        phoneNumber: 01162332101),
    Person(
        id: 3,
        company: 'Umobile',
        name: 'Muaz ',
        Reason: 'Others',
        GB: 1.5,
        date: 'Yesterday',
        phoneNumber: 01162332202),
    Person(
        id: 4,
        company: 'Umobile',
        name: 'Jalal ',
        Reason: 'Others',
        GB: 1.0,
        date: 'Yesterday',
        phoneNumber: 01162332505),
    Person(
        id: 5,
        company: 'Maxis',
        name: 'Hajar ',
        Reason: 'For study',
        GB: 1.0,
        date: 'Today',
        phoneNumber: 01162332454),
    Person(
        id: 6,
        company: 'Maxis',
        name: 'Murad ',
        Reason: 'Social media',
        GB: 0.5,
        date: 'Today',
        phoneNumber: 01162332789),
    Person(
        id: 7,
        company: 'Maxis',
        name: 'Husna ',
        Reason: 'Others',
        GB: 1.0,
        date: 'Yesterday',
        phoneNumber: 01162332025),
    Person(
        id: 8,
        company: 'Maxis',
        name: 'Marwan ',
        Reason: 'Work purpose',
        GB: 1.0,
        date: 'Today',
        phoneNumber: 01162332700),
    Person(
        id: 9,
        company: 'XoX',
        name: 'Iffat ',
        Reason: 'For study',
        GB: 2.0,
        date: 'Today',
        phoneNumber: 01162332000),
  ];
  // List<Person> get PepolList {
  //   return [...pepolList];
  // }

  List All() {
    return pepolListFiltered = pepolList;
  }

  List UmobileList() {
    return pepolListFiltered =
        pepolList.where((element) => element.company == 'Umobile').toList();
  }

  List MaxisList() {
    return pepolListFiltered =
        pepolList.where((element) => element.company == 'Maxis').toList();
  }

  List XoXList() {
    return pepolListFiltered =
        pepolList.where((element) => element.company == 'XoX').toList();
  }

  void deletePerosn(int id) {
    History.add(pepolListFiltered[id]);
    // pepolListFiltered.removeWhere((per) => per.id == id);
    pepolListFiltered.removeAt(id);
    // History.add(pepolListFiltered[id]);
    notifyListeners();
  }
}

// --------------------------------------------------------------------
