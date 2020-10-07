import 'package:covidfo/pages/detail.dart';
import 'package:covidfo/pages/home.dart';
import 'package:covidfo/pages/about.dart';
import 'package:covidfo/pages/search.dart';
import 'package:covidfo/pages/splash.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Covidfo',
      initialRoute: Splash.id,
      routes: {
        Splash.id: (context) => Splash(),
        IntroPage.id: (context) => IntroPage(),
        HomePage.id: (context) => HomePage(),
        AboutPage.id: (context) => AboutPage(),
        DetailCountryPage.id: (context) => DetailCountryPage(),
        SearchPage.id: (context) => SearchPage(),
      },
    );
  }
}
