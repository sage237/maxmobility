import 'package:flutter/material.dart';

class Responsive {
  static var _mediaQueryData; //MediaQueryData
  static var screenWidth; //double
  static var screenHeight; //double
  static var blockSizeHorizontal; //double
  static var blockSizeVertical; //double

  static var _safeAreaHorizontal; //double
  static var _safeAreaVertical; //double
  static var safeBlockHorizontal; //double
  static var safeBlockVertical; //double
  static var safeBlockVerticalWAB; //double with appbar

  static init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    safeBlockVerticalWAB =
        (screenHeight - _safeAreaVertical - AppBar().preferredSize.height) /
            100;
  }
}