import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(45)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
