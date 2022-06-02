import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //
  bool _statusDefault = true;
  bool _statusNearest = false;
  bool _statusNewest = false;
  bool _statusExpireSoon = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Flexible(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey[200],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 45,
                          width: 305,
                          padding: EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  child: Icon(
                                    Icons.search_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.circular(45)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 45,
                          child: Icon(
                            Icons.menu_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(45)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 80, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonMethod("Default", pressedDefaultButton, _statusDefault),
                        buttonMethod("Nearest", pressedNearestButton, _statusNearest),
                        buttonMethod("Newest", pressedNewestButton, _statusNewest),
                        buttonMethod("Expire soon", pressedExpireSoonButton, _statusExpireSoon),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 30,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45),
                          )),
                    ),
                  ),
                ],
              )),
          Flexible(
              flex: 6,
              child: Container(
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  GestureDetector buttonMethod(String text, Function() onTap, bool statusButton) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: statusButton ? Colors.red : Colors.black26,
            ),
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15, 
            color: statusButton ? Colors.red : Colors.black87,
          ),
        ),
      ),
    );
  }

  void pressedDefaultButton() {
    setState(() {
      _statusDefault = true;
      _statusNearest = false;
      _statusNewest = false;
      _statusExpireSoon = false;
    });
  }

  void pressedNearestButton() {
    setState(() {
      _statusDefault = false;
      _statusNearest = true;
      _statusNewest = false;
      _statusExpireSoon = false;
    });
  }

  void pressedNewestButton() {
    setState(() {
      _statusDefault = false;
      _statusNearest = false;
      _statusNewest = true;
      _statusExpireSoon = false;
    });
  }

  void pressedExpireSoonButton() {
    setState(() {
      _statusDefault = false;
      _statusNearest = false;
      _statusNewest = false;
      _statusExpireSoon = true;
    });
  }
}
