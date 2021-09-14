import 'package:flutter/material.dart';
import 'package:flutter_ex1/common/assets_common.dart';
import 'package:flutter_ex1/model/terms_conditions_model.dart';

class SettingTC extends StatefulWidget {
  const SettingTC({Key? key}) : super(key: key);

  @override
  _SettingTCState createState() => _SettingTCState();
}

class _SettingTCState extends State<SettingTC> {
  //
  late Future<TermsConditions> futureTermsConditions;

  @override
  void initState() {
    super.initState();
    futureTermsConditions = fetchTermsConditions();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 3,
            )
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), 
              topRight: Radius.circular(30)),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonMethod('DISAGREE', Colors.black54),
              buttonMethod('AGREE', Colors.red),
            ],
          ),
        ),
      ),
      body: Container(
          margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Row(children: [
                  Container(
                      height: 35,
                      child: Image.asset(
                        group975Image,
                        fit: BoxFit.cover,
                      )),
                  Container(
                    height: 45,
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'END USER LICENSE AGREEMENT',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Cosmosum Limited',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ]
              ),
            SizedBox(height: 30,),
            FutureBuilder<TermsConditions>(
              future: futureTermsConditions,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                              getTermsConditions(snapshot.data!.termsConditions),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                    ),
                  );
                } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                } else {
                    return const CircularProgressIndicator();
                }
              }),
          ])),
    ));
  }

  GestureDetector buttonMethod(String text, Color color, {Function? ontap}) {
    return GestureDetector(
      onTap: () => ontap,
      child: Container(
        height: 50,
        width: 160,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(45)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  // Remove the first word
  String getTermsConditions(String text) {
    for (int i = 0; i < text.length; i++) {
      if (text[i] == ' ') {
        return text.substring(i+1);
      }
    }
    return text;
  }

}
