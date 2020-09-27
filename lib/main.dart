import 'package:covidfo/pages/home.dart';
import 'package:covidfo/pages/about.dart';
import 'package:flutter/material.dart';
import 'package:covidfo/pages/intro.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  .then((_) => runApp(new App()));
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Covidfo',
      initialRoute: IntroPage.id,
      routes: {
        IntroPage.id: (context) => IntroPage(),
        HomePage.id: (context) => HomePage(),
        AboutPage.id: (context) => AboutPage(),
      },
    );
  }
}
