import 'package:flutter/material.dart';
import 'package:flutter_ex1/common/assets_common.dart';
import 'package:flutter_ex1/widgets/app_bar_widget.dart';
import 'package:flutter_ex1/widgets/button_widget.dart';

class SendEmailScreen extends StatelessWidget {
  const SendEmailScreen({
    Key? key,
    required this.isConfirmedEmail,
  }) : super(key: key);

  final bool isConfirmedEmail;

  //
  static const routeName = '/send-email-screen';

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
            child: isConfirmedEmail
                ? Column(
                    children: [
                      Image.asset(emailSuccessImage),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                    text: 'Your email is confirmed.',
                                    style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontSize: 18,
                                    )),
                                TextSpan(
                                  text: '\nYou are now signed in!',
                                ),
                              ])),
                      SizedBox(
                        height: 30,
                      ),
                      ButtonWidget(
                        text: 'CONTINUE',
                        onTap: pressedContinueButton,
                      )
                    ],
                  )
                : Column(
                    children: [
                      Image.asset(emailFailImage),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                    text: 'Your confirmation link is expired.',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                    )),
                                TextSpan(
                                  text: '\nPlease sign up again.',
                                ),
                              ])),
                      SizedBox(
                        height: 30,
                      ),
                      ButtonWidget(
                        text: 'TRY AGAIN',
                        onTap: pressedTryAgainButton,
                      )
                    ],
                  )),
      ),
    );
  }

  void pressedContinueButton() {}

  void pressedTryAgainButton() {}
}
