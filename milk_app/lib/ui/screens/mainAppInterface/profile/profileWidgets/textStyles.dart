import 'package:flutter/material.dart';

Widget textstyle1(String text){
  return Text(
    text,
    style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 18.0
    ),
  );
}

Widget textstyle2(String text){
  return Text(
    text,
    style: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
    ),
  );
}