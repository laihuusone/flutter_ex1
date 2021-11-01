import 'package:flutter/material.dart';

class OtpSmsVerificationPrivider extends ChangeNotifier {
  //
  late bool _isOtpSuccess = true;
  List<String> _otpValueList = [];

  //
  void clearOtpValueList() {
    _otpValueList.clear();
    notifyListeners();
  }

  void addOtpValueList(String value) {
    _otpValueList.add(value);
    notifyListeners();
  }

  List get otpValueList {
    return _otpValueList;
  }

  bool get isOtpSuccess {
    for (String ele in otpValueList) {
      if (ele == '') {
        _isOtpSuccess = false;
        break;
      }
      _isOtpSuccess = true;
    }
    return _isOtpSuccess;
  }
}