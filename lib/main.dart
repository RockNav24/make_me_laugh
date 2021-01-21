import 'package:flutter/material.dart';
import 'package:make_me_laugh/screens/screenNavigation.dart';
import 'package:make_me_laugh/screens/jokesScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ScreenNavigation.SCREEN_NAME,
      routes: {
        ScreenNavigation.SCREEN_NAME: (context) => ScreenNavigation(),
        JokeScreen.SCREEN_NAME: (context) => JokeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
