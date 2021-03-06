import 'package:flutter/material.dart';
import 'package:flutter_ex1/provider/otp_sms_verification_provider.dart';
import 'package:flutter_ex1/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<OtpSmsVerificationPrivider>(
            create: (context) => OtpSmsVerificationPrivider()),
      ],
      child: MyApp(),
    ));

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
          unselectedWidgetColor: Colors.red),
      home: LoginScreen(),
    );
  }
}
