import 'package:flutter/material.dart';

//
InputDecoration inputDecorationMethod(String label, {bool requested = true}) {
  return InputDecoration(
    label: lableInputDecoration(label, requested),
    labelStyle: TextStyle(
      color: Colors.black54,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  );
}

Widget lableInputDecoration(String label, bool requested) {
  return Text.rich(
    TextSpan(
      children: [
        WidgetSpan(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        WidgetSpan(
          child: requested
              ? Text(
                  '*',
                  style: TextStyle(color: Colors.red),
                )
              : Container(),
        ),
      ],
    ),
  );
}
