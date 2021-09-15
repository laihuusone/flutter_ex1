import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ex1/common/assets_common.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  bool isShowEye = false;
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.83,
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Column(
                  children: [
                    imageBtnMethod(group1542Image, 80),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Join with us',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500
                        ),),
                    ),
                    Text(
                      'Log in to bookmark your favorite offers, reveice',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black45
                      ),),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(
                        'weekly recommendations, and much more!',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black45
                        ),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        dividerMethod(85, 50, 30, 0),
                        Text(
                          'EASY LOG IN WITH',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),),
                        dividerMethod(85, 50, 0, 30),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        imageBtnMethod(loginGoogle, 50),
                        imageBtnMethod(loginFaceImage, 50),
                        imageBtnMethod(loginAppleImage, 50),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        dividerMethod(80, 50, 0, 0),
                        Text(
                          'OR WITH YOUR ACCOUNT',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),),
                        dividerMethod(80, 50, 0, 0),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Phone No./ Email',
                        labelStyle: TextStyle(
                          color: Colors.black54,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Colors.grey),
                        ),
                      ),
                    ),
                    TextField(
                      obscureText: isHiddenPassword,
                      onChanged: (enteredPassword) {
                        if (enteredPassword.isEmpty) {
                          setState(() {
                            isShowEye = false;
                          });
                        } else {
                          if (!isShowEye) {
                            setState(() {
                            isShowEye = !isShowEye;
                          });
                          }
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.black54,
                        ),
                        suffixIcon: isShowEye
                          ? IconButton(
                          onPressed: () {
                            setState(() {
                              isHiddenPassword = !isHiddenPassword;
                            });
                          },
                          icon: Icon(
                            isHiddenPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined))
                          : null,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.red
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.red, 
                          borderRadius: BorderRadius.circular(45)),
                      child: Center(
                        child: Text(
                          "LOG IN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black87
                          ),
                          children: [
                            TextSpan(
                              text: 'Don\'t have an account?',
                              style: TextStyle(
                                color: Colors.black
                              )
                            ),
                            TextSpan(
                              text: ' Sign Up Free',
                              style: TextStyle(
                                color: Colors.red
                              )
                            ),
                          ]
                        )
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    color: Colors.grey[800],
                    height: size.height * 0.17 - statusBarHeight,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: Colors.white,),
                              Text(
                                ' Find offers nearby',
                                style: TextStyle(
                                  color: Colors.white
                                ),)
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black87
                            ),
                            children: [
                              TextSpan(
                                text: 'By continuing, you agree to our',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white
                                )
                              ),
                              TextSpan(
                                text: ' Terms of Service',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.red
                                )
                              ),
                            ]
                          )
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black87
                            ),
                            children: [
                              TextSpan(
                                text: '&',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white
                                )
                              ),
                              TextSpan(
                                text: ' Privacy Policy',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.red
                                )
                              ),
                            ]
                          )
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                      )
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container dividerMethod(
      double width, double height, double indent, double endIndent) {
    return Container(
      width: width,
      child: Divider(
        height: height,
        thickness: 0.5,
        color: Colors.grey,
        indent: indent,
        endIndent: endIndent,
      ),
    );
  }

  InkWell imageBtnMethod(String image, double size, {Function? ontap}) {
    return InkWell(
      onTap: () => ontap,
      child: Image.asset(
        image,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
