import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/network/network.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginWidgets/forgotPasswordButton.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginWidgets/loginButton.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginWidgets/signupButton.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginWidgets/emailTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginWidgets/passwordTextField.dart';

class Login extends StatelessWidget {
  static List usersList;
  @override
  Widget build(BuildContext context) {
    Future data = Network.getUsers();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Login.usersList = snapshot.data.posts;
            return ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Column(
                    children: <Widget>[
                      _image(),
                      Text("Login:"),
                      SizedBox(height: 10.0,),
                      EmailTextField(),
                      SizedBox(height: 10.0,),
                      PasswordTextField(),
                      SizedBox(height: 20.0),
                      LoginButton(),
                      SizedBox(height: 10.0,),
                      SignUpButton(),
                      SizedBox(height: 20.0,),
                      ForgotPasswordButton()
                    ],
                  ),
                ),
              ],
            );
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }
  Widget _image() {
    return Container(
      margin: EdgeInsets.all(50.0),
      child: Image.asset(
        "assets/images/milk_splash_screen.png",
        height: 100.0,
        width: 100.0,
      ),
    );
  }
}
