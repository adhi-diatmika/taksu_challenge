import 'package:flutter/material.dart';

class CNColor{
  static primaryColor({double o = 1, bool dark = false, Color? darkColor}){
    Color darkMode = darkColor ?? blackDarkTheme(o: o);
    return dark ? darkMode : Color.fromRGBO(0, 0, 0, o);
  }

  static yellowPrimary({double o = 1}){
    return Color.fromRGBO(193, 186, 0, o);
  }

  static greenPrimary({double o = 1}){
    return Color.fromRGBO(0, 219, 128, o);
  }

  static blackPrimary({double o = 1, bool dark = false, Color? darkColor}){
    Color darkMode = darkColor ?? white(o: o);
    return dark ? darkMode : Color.fromRGBO(50, 50, 50, o);
  }

  static background({double o = 1}){
    return Color.fromRGBO(245, 248, 253, o);
  }

  static backgroundBlack({double o = 1}){
    return Color.fromRGBO(20, 19, 24, o);
  }

  static white({double o = 1, bool dark = false, Color? darkColor}){
    Color darkMode = darkColor ?? blackDarkTheme(o: o);
    return dark ? darkMode : Color.fromRGBO(255, 255, 255, o);
  }

  static silver({double o = 1}){
    return Color.fromRGBO(244, 247, 251, o);
  }

  static red({double o = 1}){
    return Color.fromRGBO(189, 52, 43, o);
  }

  static blackCN({double o = 1, bool dark = false, Color? darkColor}){
    Color darkMode = darkColor ?? white(o: o);
    return dark ? darkMode : Color.fromRGBO(35, 39, 67, o);
    // return Color.fromRGBO(70, 70, 70, o);
  }

  static blackDarkTheme({double o = 1}){
    return Color.fromRGBO(55, 51, 64, o);
  }

  static black({double o = 1, bool dark = false, Color? darkColor}){
    Color darkMode = darkColor ?? white(o: o);
    return dark ? darkMode : Color.fromRGBO(0, 0, 0, o);
  }

  static blackText({double o = 1}){
    return Color.fromRGBO(95, 95, 95, o);
  }

  static gold({double o = 1}){
    return Color.fromRGBO(218, 165, 32, o);
  }

  static yellowGold({double o = 1}){
    return Color.fromRGBO(224, 218, 60, o);
  }

  static blue({double o = 1}){
    return Color.fromRGBO(52, 107, 190, o);
  }

  static azure({double o = 1}){
    return Color.fromRGBO(95, 170, 236, o);
  }

  static indigo({double o = 1}){
    return Color.fromRGBO(103, 118, 199, o);
  }

  static purple({double o = 1}){
    return Color.fromRGBO(154, 102, 226, o);
  }

  static softPurple({double o = 1}){
    return Color.fromRGBO(76, 64, 132, o);
  }

  static pink({double o = 1}){
    return Color.fromRGBO(255, 111, 128, o);
  }

  static orange({double o = 1}){
    return Color.fromRGBO(241, 150, 69, o);
  }

  static yellow({double o = 1}){
    return Color.fromRGBO(240, 178, 63, o);
  }

  static lime({double o = 1}){
    return Color.fromRGBO(163, 212, 79, o);
  }

  static green({double o = 1}){
    return Color.fromRGBO(75, 167, 99, o);
  }

  static teal({double o = 1}){
    return Color.fromRGBO(98, 200, 186, o);
  }

  static cyan({double o = 1}){
    return Color.fromRGBO(73, 160, 181, o);
  }

  static grey({double o = 1}){
    return Color.fromRGBO(169, 174, 182, o);
  }

  static greyBG({double o = 1, bool dark = false, Color? darkColor}){
    Color darkMode = darkColor ?? backgroundBlack(o: o);
    return dark ? darkMode : Color.fromRGBO(241, 241, 241, o);
  }

  static lightGrey({double o = 1, bool dark = false, Color? darkColor}){
    Color darkMode = darkColor ?? blackDarkTheme(o: o);
    return dark ? darkMode : Color.fromRGBO(230, 230, 230, o);
  }

  static darkGrey({double o = 1}){
    return Color.fromRGBO(110, 114, 121, o);
  }

  static lightBlueGrey({double o = 1}){
    return Color.fromRGBO(229, 232, 236, o);
  }

  static greyText({double o = 1}){
    return Color.fromRGBO(142, 142, 142, o);
  }

  static greyIcon({double o = 1}){
    return Color.fromRGBO(115, 108, 108, o);
  }

  static greyBorder({double o = 1}){
    return Color.fromRGBO(226, 230, 235, o);
  }

  static darkRed({double o = 1}){
    return Color.fromRGBO(72, 19, 20, o);
  }

  static List<Color> gradientRed({double o = 1}){
    return [
      Color.fromRGBO(229, 0, 41, o),
      const Color.fromRGBO(210, 60, 63, 0.87),
      const Color.fromRGBO(229, 0, 55, 0.6),
    ];
  }

  static transparent(){
    return Colors.transparent;
  }
}