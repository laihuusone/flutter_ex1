import 'package:flutter/material.dart';
import 'package:flutter_ex1/common/constant_common.dart';
import 'package:flutter_ex1/common/widget_common.dart';
import 'package:flutter_ex1/screens/confirm_send_email_screen.dart';
import 'package:flutter_ex1/widgets/birthday_widget.dart';
import 'package:flutter_ex1/widgets/button_widget.dart';
import 'package:flutter_ex1/widgets/phone_number_widget.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  //
  late String _email;
  late String _password;
  late String _confirmPassword;
  late String _gender = genderList[0];
  late String _firstName;
  late String _lastName;
  late String _phone;
  late String _birthday;
  late bool _consent = false;
  late bool _recommendations = false;

  //
  bool isShowEyePassword = false;
  bool isHiddenPassword = true;
  bool isShowEyeConfirmPassword = false;
  bool isHiddenConfirmPassword = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildEmailField(),
                  _buildPasswordField(),
                  _buildConfirmPasswordField(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildeGenderRadio(),
                  _buildFirstNameField(),
                  _buildLastNameField(),
                  SizedBox(
                    height: 10,
                  ),
                  PhoneNumberWidget(
                    requested: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _buildBirthday(),
                  SizedBox(
                    height: 20,
                  ),
                  _consentCheckBox(),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  _recommendationsSwitch(),
                  SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                    text: 'SIGN UP', 
                    onTap: pressedSignUpButton,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
  Widget _buildEmailField() {
    return TextFormField(
      decoration: inputDecorationMethod('Email '),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is not empty.';
        } else {
          if (!value.contains('@')) {
            return 'Email is not valid.';
          }
        }
        return null;
      },
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: isHiddenPassword,
      decoration: InputDecoration(
        label: lableInputDecoration('Password ', true),
        labelStyle: TextStyle(
          color: Colors.black54,
        ),
        suffixIcon: isShowEyePassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isHiddenPassword = !isHiddenPassword;
                  });
                },
                icon: Icon(isHiddenPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined))
            : null,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      onChanged: (enteredPassword) {
        if (enteredPassword.isEmpty) {
          setState(() {
            isShowEyePassword = false;
          });
        } else {
          if (!isShowEyePassword) {
            setState(() {
              isShowEyePassword = !isShowEyePassword;
            });
          }
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is not empty.';
        }
        _confirmPassword = value;
        return null;
      },
      onSaved: (value) {
        _password = value!;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      obscureText: isHiddenConfirmPassword,
      decoration: InputDecoration(
        label: lableInputDecoration('Confirm Password ', true),
        labelStyle: TextStyle(
          color: Colors.black54,
        ),
        suffixIcon: isShowEyeConfirmPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isHiddenConfirmPassword = !isHiddenConfirmPassword;
                  });
                },
                icon: Icon(isHiddenConfirmPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined))
            : null,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      onChanged: (enteredPassword) {
        if (enteredPassword.isEmpty) {
          setState(() {
            isShowEyeConfirmPassword = false;
          });
        } else {
          if (!isShowEyeConfirmPassword) {
            setState(() {
              isShowEyeConfirmPassword = !isShowEyeConfirmPassword;
            });
          }
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Confirm Password is not empty.';
        } else {
          if (value != _confirmPassword) {
            return 'Confirm Password is not correct.';
          }
        }
        return null;
      },
    );
  }

  Widget _buildeGenderRadio() {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          lableInputDecoration('Gender ', true),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: genderList.map((ele) {
              return Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Radio(
                        value: ele,
                        groupValue: _gender,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          setState(() {
                            _gender = value.toString();
                          });
                        }),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(ele),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstNameField() {
    return TextFormField(
      decoration: inputDecorationMethod('First Name '),
      validator: (value) {
        if (value!.isEmpty) {
          return 'First Name is not empty.';
        }
        return null;
      },
      onSaved: (value) {
        _firstName = value!;
      },
    );
  }

  Widget _buildLastNameField() {
    return TextFormField(
      decoration: inputDecorationMethod('Last Name ', requested: false),
      onChanged: (value) {
        if (value.isEmpty) {
          _lastName = '';
        } else {
          _lastName = value;
        }
      },
    );
  }

  Widget _buildBirthday() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Birthday',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          BirthdayWidget(),
        ],
      ),
    );
  }

  Widget _consentCheckBox() {
    return Row(
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: Checkbox(
              value: _consent,
              activeColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onChanged: (value) {
                setState(() {
                  _consent = value!;
                });
              }),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            'I consent for the above personal data to be provided to Cosmosum for',
            style: TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  _recommendationsSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Receive weekly recommendations'),
        Switch(
            value: _recommendations,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _recommendations = value;
              });
            }),
      ],
    );
  }

  pressedSignUpButton() {
    // if (!_formKey.currentState!.validate()) {
    //   return;
    // }
    // _formKey.currentState!.save();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ConfirmSendEmailScreen()));
  }
}
