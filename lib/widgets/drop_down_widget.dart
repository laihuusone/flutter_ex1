import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    Key? key,
    required this.itemList,
    required this.value,
    required this.onChanged,
    required this.hint,
    required this.width,
    this.height = 50,
  }) : super(key: key);

  final List<String> itemList;
  final String value;
  final Function onChanged;
  final String hint;
  final double width;
  final double height;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton(
        value: widget.value,
        hint: Text(widget.hint),
        underline: SizedBox(),
        onChanged: (newValue) {
          widget.onChanged(newValue);
        },
        items: widget.itemList.map((ele) {
          return DropdownMenuItem(
            value: ele,
            child: Text(
              ele,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}