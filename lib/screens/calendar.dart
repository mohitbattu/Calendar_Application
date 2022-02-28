import 'package:calendar_app/utils/date_time.dart' as date_time;
import 'package:flutter/material.dart';
import '../constants.dart';
import '../utils/date_time.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  // Preliminary varibles required for the Calendar Screen class.
  String monthname = "", year = "", texting = "";
  List<List<String>> nodays = [];
  Map<int, String> data = {};
  final _textController = TextEditingController();

  /*
  displayInfo(): 
  Through this function, I have passed the three main data to the Calendar Screen.
  The name of the current month, year and total days in a month are printed in 
  the screen.
  */
  void displayInfo() {
    var monthYr = date_time.monthYear();
    var dayslist = date_time.monthDays();
    setState(() {
      monthname = monthYr[0];
      nodays = dayslist;
      year = monthYr[1];
    });
  }

  @override
  void initState() {
    super.initState();
    displayInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                /* TextFormField is Defined here with the text editing controllers 
                 value in the texfield is instantaneously saved to the 
                 texting variable. */
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Material(
                    color: purpleColor,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    elevation: 20.0,
                    shadowColor: lightblackColor,
                    child: TextFormField(
                      controller: _textController,
                      autofocus: true,
                      maxLines: 14,
                      style: textFormStyle,
                      keyboardType: TextInputType.multiline,
                      decoration: textInputDecoration,
                      onChanged: (value) {
                        setState(() {
                          texting = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.045),
                // Month Name is displayed here in the screen.
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    textPrint(monthname, textMonthYrStyle),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    textPrint(year, textMonthYrStyle),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.028),
                // The Name of the Weekdays (i.e. Sunday(S), Monday(M), Tuesday (T)..) are mentioned here.
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: weekDecoration,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.065),
                      textPrint('S', textStyle),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                      textPrint('M', textStyle),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                      textPrint('T', textStyle),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                      textPrint('W', textStyle),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                      textPrint('T', textStyle),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                      textPrint('F', textStyle),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.075),
                      textPrint('S', textStyle),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.026),
                // The total number of days grid is presented here.
                Container(
                  width: MediaQuery.of(context).size.width * 0.74,
                  height: MediaQuery.of(context).size.height * 0.26,
                  child: GridView.builder(
                    itemCount: nodays.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var currentdate = DateTime.now();
                      var presentmonth = currentdate.month;
                      // The previous month days are greyed out here.
                      if (presentmonth < int.parse(nodays[index][1])) {
                        return textPrint(nodays[index][2], greyTextStyle);
                      }
                      /* The current month days are enabled with the InkWell Buttons such that user 
                      can add their events */
                      else if (presentmonth == int.parse(nodays[index][1])) {
                        /* When user selects any specific dates then the below code changes to the purple backgroundColor
                        with white text formation and increased font size makes it unique from ordinary dates. */
                        if (date_time.chosenday ==
                                int.parse(nodays[index][2]) &&
                            date_time.selectdate != true) {
                          return Ink(
                            decoration: selectDate,
                            child: InkWell(
                              canRequestFocus: true,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  textPrint(nodays[index][2], whiteTextStyle),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  date_time.selectdate = true;
                                });
                              },
                            ),
                          );
                        }
                        /* The days with the user selected dates and with their specified events are 
                        then saved in the form of Map<int,String> format to the data variable */
                        if (date_time.selectdate == false && texting != "") {
                          for (var j in [date_time.chosenday]) {
                            var char = "";
                            for (var i = 0; i < texting.length; i++) {
                              char += texting[i].toString();
                            }
                            data[j] = char;
                          }
                        }
                        /* its a condition when the text is emptied in one of the 
                        selected date then outlined circle is removed from the 
                        calendar.
                        */
                        if (texting == "" && date_time.selectdate == false) {
                          data.remove(date_time.chosenday);
                        }
                        /* The events which are saved with respect to the date are 
                        then marked with outline circle here. This below snippet allows the user
                        to modify their events.*/
                        if (data.isNotEmpty) {
                          for (var date in data.keys) {
                            if (date == int.parse(nodays[index][2])) {
                              return Ink(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                        width: 1.5, color: purpleColor)),
                                child: InkWell(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      textPrint(
                                          nodays[index][2], blackTextStyle1),
                                    ],
                                  ),
                                  onTap: () {
                                    date_time.chosenday =
                                        int.parse(nodays[index][2]);
                                    _textController.text =
                                        data[date].toString();
                                  },
                                ),
                              );
                            }
                          }
                        }
                        // The below snippet displays the present month days.
                        return Ink(
                          decoration: const BoxDecoration(),
                          child: InkWell(
                            canRequestFocus: true,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                textPrint(nodays[index][2], blackTextStyle2),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                _textController.clear();
                                texting = "";
                                date_time.selectdate = false;
                                date_time.chosenday =
                                    int.parse(nodays[index][2]);
                              });
                            },
                          ),
                        );
                      }
                      // The days which are present in the next month are greyed out here.
                      else {
                        return textPrint(nodays[index][2], greyTextStyle);
                      }
                      // return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}