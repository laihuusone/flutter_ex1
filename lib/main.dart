import 'package:flutter/material.dart';
import 'screens/language_screen.dart';
import 'screens/settingTC_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        unselectedWidgetColor: Colors.red
      ),
      home: SettingTC(),
    );
  }
}
