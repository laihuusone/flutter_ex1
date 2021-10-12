import 'package:flutter/material.dart';
import 'package:flutter_ex1/screens/sms_verification_screen.dart';
import 'package:flutter_ex1/widgets/button_widget.dart';
import 'package:flutter_ex1/widgets/phone_number_widget.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: [
              textMethod(),
              SizedBox(
                height: 25,
              ),
              PhoneNumberWidget(),
              ButtonWidget(
                text: 'SIGN UP',
                onTap: pressedSignUpButton,
              )
            ],
          ),
        ),
      ),
    );
  }

  //
  Text textMethod() {
    return Text(
      'Please enter your phone no. below and verification code will be sent via SMS.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13,
        color: Colors.black,
      ),
    );
  }

  void pressedSignUpButton() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SmsVerificationScreen()));
  }
}
