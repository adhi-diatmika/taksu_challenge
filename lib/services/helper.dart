import 'package:flutter/material.dart';

//push navigator
push(context,route){
  return Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => route
  ));
}

//push replacement navigator
pushReplacement(context,route){
  Navigator.of(context).popUntil((route) => route.isFirst);
  return Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) => route
  ));
}

// get screen size, MQuery.width(context)
class MQuery{
  static width(context){
    return MediaQuery.of(context).size.width;
  }

  static height(context){
    return MediaQuery.of(context).size.height;
  }

  static statusBar(context){
    return MediaQuery.of(context).padding.top;
  }
}