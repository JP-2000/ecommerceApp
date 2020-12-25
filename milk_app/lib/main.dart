import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/ui/appUi.dart';

import 'exp.dart';


void main() => runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animations',
      theme:ThemeData.dark().copyWith(
            accentColor: Colors.white,
      ),
      home: AppUi(),
    )
);


