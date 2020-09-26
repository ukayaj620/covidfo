import 'package:flutter/material.dart';
import 'package:covidfo/pages/intro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
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
      },
    );
  }
}
