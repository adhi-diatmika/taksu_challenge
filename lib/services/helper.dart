import 'package:flutter/material.dart';

push(context,route){
  return Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => route
  ));
}

pushReplacement(context,route){
  Navigator.of(context).popUntil((route) => route.isFirst);
  return Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) => route
  ));
}