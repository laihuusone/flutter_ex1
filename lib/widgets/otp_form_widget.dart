import 'package:flutter/material.dart';
import 'package:flutter_ex1/provider/otp_sms_verification_provider.dart';
import 'package:provider/provider.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  //
  final pin1Controller = TextEditingController();
  final pin2Controller = TextEditingController();
  final pin3Controller = TextEditingController();
  final pin4Controller = TextEditingController();

  //
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin1Controller.dispose();
    pin2Controller.dispose();
    pin3Controller.dispose();
    pin4Controller.dispose();
    //
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField({required String value, required FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    //
    var otpSmsVerificationProvider =
        Provider.of<OtpSmsVerificationPrivider>(context);

    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 70,
            child: TextFormField(
              controller: pin1Controller,
              autofocus: true,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (value) {
                nextField(value: value, focusNode: pin2FocusNode);
              },
            ),
          ),
          SizedBox(
            width: 70,
            child: TextFormField(
              controller: pin2Controller,
              focusNode: pin2FocusNode,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (value) {
                nextField(value: value, focusNode: pin3FocusNode);
              },
            ),
          ),
          SizedBox(
            width: 70,
            child: TextFormField(
              controller: pin3Controller,
              focusNode: pin3FocusNode,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (value) {
                nextField(value: value, focusNode: pin4FocusNode);
              },
            ),
          ),
          SizedBox(
            width: 70,
            child: TextFormField(
              controller: pin4Controller,
              focusNode: pin4FocusNode,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (value) {
                pin4FocusNode.unfocus();
                if (value.isNotEmpty) {
                  otpSmsVerificationProvider.clearOtpValueList();
                  otpSmsVerificationProvider
                      .addOtpValueList(pin1Controller.text);
                  otpSmsVerificationProvider
                      .addOtpValueList(pin2Controller.text);
                  otpSmsVerificationProvider
                      .addOtpValueList(pin3Controller.text);
                  otpSmsVerificationProvider
                      .addOtpValueList(pin4Controller.text);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
