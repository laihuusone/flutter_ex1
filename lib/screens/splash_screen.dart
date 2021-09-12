import 'package:flutter/material.dart';
import 'package:flutter_ex1/common/assets_common.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.55,
                child: Image.asset(splashImage),
              ),
              Text(
                'Find offers now!',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 38,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30,),
              offersMethod('+23 offers', ' in your current district'),
              offersMethod('+12 offers', ' within 600m of your current location'),
              offersMethod('+8 offers', ' within 300m of your current location'),
              SizedBox(height: 40,),
              Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(45)),
                child: Center(
                  child: Text(
                    "CONTINUE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container offersMethod(String number, String detail) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: RichText(
          text: TextSpan(
              style: TextStyle(
                color: Colors.black87,
                fontSize: 17,
              ),
              children: [
            TextSpan(text: number, style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: detail)
          ])),
    );
  }
}
