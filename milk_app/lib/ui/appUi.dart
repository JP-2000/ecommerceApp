import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:milk_app/ui/screens/splashScreen.dart';

class AppUi extends StatefulWidget {
  @override
  _AppUiState createState() => _AppUiState();
}

class _AppUiState extends State<AppUi> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: SplashScreenUI(),
          ),
        ],
      ),
    );
  }
}