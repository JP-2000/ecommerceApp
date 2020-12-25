import 'package:flutter/material.dart';
import 'package:milk_app/network/network.dart';
import 'package:milk_app/ui/screens/loginSystem/forgotPasswordPage/forgotPasswordWidgets/emailTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/forgotPasswordPage/forgotPasswordWidgets/nextButton.dart';

class ForgotPassword extends StatefulWidget {
  static List usersList;
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    Future data = Network.getUsers();
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            ForgotPassword.usersList = snapshot.data.posts;
            return Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 80.0,),
                    SizedBox(height: 20.0,),
                    EmailTextField(),
                    SizedBox(height: 20.0,),
                    NextButton()
                  ],
                ),
              ),
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }
}
