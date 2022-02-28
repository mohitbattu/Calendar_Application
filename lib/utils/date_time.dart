import 'package:date_utils/date_utils.dart' as utils;
import 'package:flutter/material.dart';

/*
1. The date utils and material packages are imported in 
this file.

2. The basic variable declaration is done here for knowing the 
state of the selected date and Container decoration.

3. The monthYear function returns the name of the month and the 
year in a list.

4. The monthDays function returns the total number of days for 
the month.

5. The Widget is used for printing the text in the Calendar Screen.
*/
bool selectdate = true;
var chosenday = 0;
List<String> monthYear() {
  var months = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December'
  };
  var currentdate = DateTime.now();
  var monthnum = currentdate.month;
  var year = currentdate.year;
  var monthname = months[monthnum];
  return [monthname.toString(), year.toString()];
}

List<List<String>> monthDays() {
  var currentdate = DateTime.now();
  List<List<String>> data = [];
  var rawdays = utils.DateUtils.daysInMonth(currentdate);
  for (var i = 0; i < rawdays.length; i++) {
    var timestamp = rawdays[i].toString();
    var spacingdat = timestamp.split(" ");
    var datesplit = spacingdat[0].split("-");
    data.add(datesplit);
  }
  return data;
}

Widget textPrint(String body, TextStyle textLook) {
  return Text(body, style: textLook);
}
