import 'package:covidfo/components/cov_card_human.svg.dart';
import 'package:covidfo/components/cov_up_app_bar.dart';
import 'package:covidfo/constants/palette.dart';
import 'package:flutter/material.dart';

class Developer {
  String name;
  String studentId;
  String imagePath;

  Developer({
    this.name,
    this.studentId,
    this.imagePath
  });
}

class AboutPage extends StatelessWidget {

  static const String _id = 'about';

  static String get id => _id;

  List<Developer> developer = [
    Developer(
      name: 'Jayaku Briliantio',
      studentId: '32180018',
      imagePath: 'assets/human/jayaku.jpg',
    ),
    Developer(
      name: 'Ferdy Nicolas',
      studentId: '32180018',
      imagePath: 'assets/human/ferdy.jpg',
    ),
    Developer(
      name: 'Daniel Ronaldo Pangestu',
      studentId: '32180018',
      imagePath: 'assets/human/daniel.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CovUpAppBar(appBarText: 'About'),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0),
        color: Palette.backgroundColor,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) =>  CovCardHuman(
            name: developer[index].name,
            studentId: developer[index].studentId,
            imagePath: developer[index].imagePath,
          ),
          itemCount: developer.length,
        ),
      ),
    );
  }
}