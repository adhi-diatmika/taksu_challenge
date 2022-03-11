import 'package:flutter/material.dart';

class TaksuColor{
  static primaryBG({double o = 1}){
    return Color.fromRGBO(54, 57, 63, o);
  }

  static primaryCard({double o = 1}){
    return Color.fromRGBO(64, 68, 75, o);
  }

  static primaryBlack({double o = 1}){
    return Color.fromRGBO(65, 65, 65, o);
  }

  static white({double o = 1}){
    return Color.fromRGBO(255, 255, 255, o);
  }

  static primaryGreen({double o = 1}){
    return Color.fromRGBO(57, 195, 109, o);
  }

  static primaryGrey({double o = 1}){
    return Color.fromRGBO(196, 196, 196, o);
  }

  static primaryRed({double o = 1}){
    return Color.fromRGBO(195, 57, 57, o);
  }

  static primaryPurple({double o = 1}){
    return Color.fromRGBO(84, 64, 209, o);
  }

  static transparent(){
    return Colors.transparent;
  }
}