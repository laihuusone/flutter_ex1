import 'package:flutter/material.dart';
import 'package:flutter_ex1/common/widget_common.dart';
import 'package:flutter_ex1/model/language_model.dart';
import 'package:flutter_ex1/screens/sms_verification_screen.dart';

class PhoneNumberWidget extends StatefulWidget {
  const PhoneNumberWidget({
    Key? key,
    this.requested = true,
    }) : super(key: key);

  final bool requested;

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  //
  List<LanguageModel> _languageList = [];
  late String _selectedValue = '2';
  late bool _isError = false;

  TextEditingController _phone = TextEditingController();

  @override
  void initState() {
    super.initState();
    _languageList = LanguageModel.getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.requested ? 100 : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          areaCodeDropDownMethod(),
          Flexible(
            child: phoneFieldMethod(widget.requested),
          ),
        ],
      ),
    );
  }

  Container areaCodeDropDownMethod() {
    return Container(
      height: 50,
      width: 130,
      margin: EdgeInsets.only(
        top: 11,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        value: _selectedValue,
        underline: SizedBox(),
        onChanged: (newValue) {
          setState(() {
            _selectedValue = newValue.toString();
          });
        },
        items: _languageList
            .map<DropdownMenuItem<String>>((LanguageModel language) {
          return DropdownMenuItem(
              value: language.id.toString(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    language.image,
                    width: 30,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        language.areaCode,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ))
                ],
              ));
        }).toList(),
      ),
    );
  }

  Container phoneFieldMethod(bool requested) {
    return Container(
      margin: EdgeInsets.only(
        left: 11,
      ),
      child: TextField(
        controller: _phone,
        decoration: InputDecoration(
          label: lableInputDecoration('Phone No.', requested),
          labelStyle: TextStyle(
            color: Colors.black54,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          errorText: _isError ? 'Phone is not empty.' : null,
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              _isError = false;
            });
          }
        },
      )
    );
  }

  void checkPhoneNumber() {
    if (_phone.text.isEmpty) {
      setState(() {
        _isError = true;
      });
    } else {
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => SmsVerificationScreen()));
    }
  }
}