import 'package:flutter/material.dart';
import 'package:flutter_ex1/common/assets_common.dart';
import 'package:flutter_ex1/screens/send_email_screen.dart';
import 'package:flutter_ex1/widgets/app_bar_widget.dart';
import 'package:flutter_ex1/widgets/button_widget.dart';

class ConfirmSendEmailScreen extends StatefulWidget {

  const ConfirmSendEmailScreen({Key? key}) : super(key: key);
  //
  static const routeName = '/confirm-send-email-screen';

  @override
  State<ConfirmSendEmailScreen> createState() => _ConfirmSendEmailScreenState();
}

class _ConfirmSendEmailScreenState extends State<ConfirmSendEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Email Confirmation',
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: [
              Image.asset(confirmEmailImage),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'A confirmation email has been sent to ',
                        ),
                        TextSpan(
                            text: 'newuser@gmail.com',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                          text: '. Please open the email and click the confirmation link.',
                        ),
                      ])),
              SizedBox(
                height: 30,
              ),
              ButtonWidget(
                text: 'CONTINUE',
                onTap: pressedContinueButton,
                onLongPress: longPressedContinueButton,
              )
            ],
          ),
        ),
      ),
    );
  }

  void pressedContinueButton() {
    Navigator.push(context, 
      MaterialPageRoute(builder: (context) => SendEmailScreen(isConfirmedEmail: true)));
  }

  void longPressedContinueButton() {
    Navigator.push(context, 
      MaterialPageRoute(builder: (context) => SendEmailScreen(isConfirmedEmail: false)));
  }
}
