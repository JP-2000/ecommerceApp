import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginPage.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenUI extends StatefulWidget {
  @override
  _SplashScreenUIState createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  static int status;

  Future<void> _getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    status = prefs.getInt("login_status");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SplashScreen(
//          title: Text(
//            "Milk Mobile App",
//            style: TextStyle(color: Colors.black),
//          ),
          loadingText: Text(
            "Milk Mobile App",
            style: TextStyle(color: Colors.black),
          ),
          seconds: 8,
          backgroundColor: Colors.white,
//          loaderColor: Colors.white,
          image: Image.asset(
            'assets/images/sugoi.gif',
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          ),
          photoSize: 100.0,
          navigateAfterSeconds: Login(),
        ),
      ),
    );
  }
}
