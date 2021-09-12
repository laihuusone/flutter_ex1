import 'package:flutter/material.dart';
import 'package:flutter_ex1/common/assets_common.dart';
import 'package:flutter_ex1/model/language_model.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  //
  int _value = 1;
  late List<LanguageModel> languages;

  @override
  void initState() {
    super.initState();
    languages = LanguageModel.getLanguage();
  }

  //
  List<Widget> languageList() {
    List<Widget> widgets = [];
    for (LanguageModel language in languages) {
      widgets.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Card(
            elevation: 2,
          child: ListTile(
            title: Text(language.title),
            leading: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundImage: AssetImage(language.image)
              ),
            ),
            trailing: Transform.scale(
              scale: 5/4,
              child: Radio(
                value: language.id, 
                groupValue: _value, 
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    _value = language.id;
                  });
                }
              ),
            ),
          ),
        ),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                height: size.height * 0.3,
                child: Image.asset(languageImage),
              ),
              Text(
                "Your Choose Your Preferred Language",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red
                ),
                ),
              Text(
                "Please select your language",
                style: TextStyle(
                  color: Colors.black54
                ),
                ),
              SizedBox(height: 50,),
              Column(
                children: languageList(),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
                    decoration: BoxDecoration(
                        color: Colors.red, borderRadius: BorderRadius.circular(45)),
                    child: Center(
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
