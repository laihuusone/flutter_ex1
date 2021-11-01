import 'package:flutter/material.dart';
import 'package:flutter_ex1/provider/otp_sms_verification_provider.dart';
import 'package:flutter_ex1/widgets/app_bar_widget.dart';
import 'package:flutter_ex1/widgets/button_widget.dart';
import 'package:flutter_ex1/widgets/otp_form_widget.dart';
import 'package:provider/provider.dart';

class SmsVerificationScreen extends StatefulWidget {
  const SmsVerificationScreen({Key? key}) : super(key: key);
  //
  static const routeName = '/sms-verification-screen';

  @override
  State<SmsVerificationScreen> createState() => _SmsVerificationScreenState();
}

class _SmsVerificationScreenState extends State<SmsVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    //
    var otpSmsVerificationProvider =
        Provider.of<OtpSmsVerificationPrivider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'SMS Verification',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              otpSmsVerificationProvider.isOtpSuccess
                  ? Container()
                  : showVerificationMethod(),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    textMethod(),
                    SizedBox(
                      height: 30,
                    ),
                    OtpForm(),
                    SizedBox(
                      height: 50,
                    ),
                    ButtonWidget(
                      text: 'RESEND VERIFICATION CODE',
                      onTap: pressedResendButton,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //
  Container showVerificationMethod() {
    return Container(
      height: 50,
      color: Colors.red[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            color: Colors.red,
          ),
          Text(
            '  Verification failed. Please try again.',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Center textMethod() {
    return Center(
      child: Text(
        'Please input the 4-digit code you received in SMS',
        style: TextStyle(
          fontSize: 13,
          color: Colors.black,
        ),
      ),
    );
  }

  void pressedResendButton() {}
}
