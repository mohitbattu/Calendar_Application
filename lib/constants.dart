import 'package:flutter/material.dart';
//Basic Colors
const purpleColor = Color.fromARGB(255, 79, 28, 219);
const whiteColor = Color.fromARGB(255, 255, 255, 255);
const blackColor = Color.fromARGB(255, 0, 0, 0);
const lightblackColor = Color.fromARGB(255, 32, 31, 31);
const greyColor = Color.fromARGB(255, 87, 84, 84);
// TextForm Styles and Colors.
const textFormBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(color: purpleColor));
const textFormHint =
    TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 161, 149, 175));
const textFormStyle = TextStyle(fontSize: 20, color: whiteColor);
// Month Name and Year Styles.
const textMonthYrStyle =
    TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: blackColor);
// BoxDecoration
const weekDecoration = BoxDecoration(
  color: Color.fromARGB(255, 221, 213, 213),
  borderRadius: BorderRadius.all(Radius.circular(10)),
);
// selected Dates BoxDecoration
const selectDate = BoxDecoration(
    color: purpleColor, borderRadius: BorderRadius.all(Radius.circular(4)));
const textInputDecoration = InputDecoration(
  fillColor: purpleColor,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
  border: textFormBorder,
  hintText: "Add event here..   ",
  hintStyle: textFormHint,
  focusedBorder: textFormBorder,
  enabledBorder: textFormBorder,
);
// greyStyle
const greyTextStyle =
    TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: greyColor);
// whiteTextStyle
const whiteTextStyle =
    TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: whiteColor);

// Black text style with different fontsizes.
const blackTextStyle1 =
    TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: blackColor);
const blackTextStyle2 =
    TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: blackColor);
const textStyle =
    TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: blackColor);
