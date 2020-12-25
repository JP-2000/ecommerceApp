import 'package:flutter/material.dart';
import 'package:milk_app/network/network.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginPage.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/confirmPasswordTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/emailTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/firstNameTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/lastNameTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/passwordTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/phoneTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/signupButton.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future data = Network.getUsers();
    return WillPopScope(
      onWillPop: () async {
        FirstNameTextField.firstName = null;
        LastNameTextField.lastName = null;
        EmailTextField.email = null;
        PhoneTextField.phone = null;
        PasswordTextField.password = null;
        ConfirmPasswordTextField.password = null;
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Login()
            )
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Signup"),
        ),
        body: FutureBuilder(
          future: data,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Registration Form",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0
                            ),
                          ),
                          margin: EdgeInsets.only(top: 20.0),
                        ),
                        FirstNameTextField(),
                        LastNameTextField(),
                        EmailTextField(),
                        PhoneTextField(),
                        PasswordTextField(),
                        ConfirmPasswordTextField(),
                        SignUpButton()
                      ],
                    ),
                  )
                ],
              );
            }
            else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

