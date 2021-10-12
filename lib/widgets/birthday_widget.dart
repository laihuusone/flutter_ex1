import 'package:flutter/material.dart';
import 'package:flutter_ex1/common/constant_common.dart';
import 'package:flutter_ex1/widgets/drop_down_widget.dart';

class BirthdayWidget extends StatefulWidget {
  const BirthdayWidget({Key? key}) : super(key: key);

  @override
  State<BirthdayWidget> createState() => _BirthdayWidgetState();
}

class _BirthdayWidgetState extends State<BirthdayWidget> {
  //
  List<String> _dayList = [];
  List<String> _monthList = [];
  List<String> _yearList = [];
  late String _selectedDay = '1';
  late String _selectedMonth = '1';
  late String _selectedYear = '1991';

  @override
  void initState() {
    super.initState();
    _dayList = dayList;
    _monthList = monthList;
    _yearList = yearList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _dropDownDay(),
        _dropDownMonth(),
        _dropDownYear(),
      ],
    );
  }

  Widget _dropDownDay() {
    return DropDownWidget(
      width: 100,
      hint: 'DD',
      value: _selectedDay,
      itemList: _dayList,
      onChanged: (newValue) {
        setState(() {
          _selectedDay = newValue;
        });
      },
    );
  }

  _dropDownMonth() {
    return DropDownWidget(
      width: 100,
      hint: 'MM',
      value: _selectedMonth,
      itemList: _monthList,
      onChanged: (newValue) {
        setState(() {
          _selectedMonth = newValue;
        });
      },
    );
  }

  _dropDownYear() {
    return DropDownWidget(
      width: 100,
      hint: 'YYYY',
      value: _selectedYear,
      itemList: _yearList,
      onChanged: (newValue) {
        setState(() {
          _selectedYear = newValue;
        });
      },
    );
  }
}
