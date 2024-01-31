import 'package:flutter/material.dart';

class AppColors {
  // static const Color kPrimaryColor = Color(0xff18092E);
  static const Color kPrimaryColor = Color(0xff8d9115);
  static const Color kPrimaryLightColor = Color(0xff422070);
  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xff99d7e8), Color(0xff7bcfe6)],
  );
  static const kSecondaryColor = Color(0xFF979797);
  static const Color kTextColor = Color(0xff18092E);
  static const Color whiteColor = Color(0xffffffff);
  static const Color charcoalColor = Color(0xFF202427);
  static const Color buttonColor =  Color(0xff0e051e);
}

class FontSize {
  double kButtonText = 16;
}

// TextStyle headingStyle = TextStyle(
//   fontWeight: FontWeight.bold,
//   fontSize: getProportinateScreenWidth(13),
//   color: Colors.black,
// );
//
//
// TextStyle priceStyle = TextStyle(
//   fontSize: getProportinateScreenWidth(8.5),
//   fontWeight: FontWeight.w600,
//   color: AppColor.kPrimaryColor,
// );
//
const textInput = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    // vertical: getProportinateScreenHeight(18),
    // horizontal: getProportinateScreenWidth(13),
    vertical: 15,
    horizontal: 13,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(17)),
    borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 0.1),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.kPrimaryColor),
    borderRadius: BorderRadius.all(Radius.circular(17)),
  ),
);


var greyContainerCover = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: Colors.grey[100],
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 1,
      blurRadius: 1,
      offset: Offset(0, 1), // changes position of shadow
    ),
  ],
);