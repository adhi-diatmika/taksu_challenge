import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

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

//convert date format
String dateConvert({@required var date, String? dateFormat = 'dd MMMM yyyy hh:mma', String locale = 'en'}){
  initializeDateFormatting(locale); //inisialisasi date dalam  bahasa indonesia
  DateTime dateTime = DateTime.parse(date.toString());
  DateFormat format = DateFormat(dateFormat, locale); // 'id' kode untuk bahasa indonesia
  String formatted = format.format(dateTime).toString();
  return formatted;
}