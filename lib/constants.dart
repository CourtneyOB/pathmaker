import 'package:flutter/material.dart';

//layout constants

const kSizeMWidth = 910;
const kSizeLWidth = 1190;
const kSizeXLWidth = 1375;
const kWebHorizontalPadding = 50.0;

const kCharacterSheetDemographicsMaxHeight = 170.0;

//colours

const Color kDarkPrimaryColour = Color(0xff455A64);
const Color kLightPrimaryColour = Color(0xffCFD8DC);
const Color kPrimaryColour = Color(0xff607D8B);
const Color kAccentColour = Color(0xff9E9E9E);
const Color kPrimaryTextColour = Color(0xff212121);
const Color kSecondaryTextColour = Color(0xff757575);
const Color kDividerColour = Color(0xffBDBDBD);

//decor

const BoxDecoration kBoxShadow = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: kDividerColour,
      spreadRadius: 1.0,
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ],
);
