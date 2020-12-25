import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/forgotPasswordPage/changePassword/widgets/confirmButton.dart';
import 'package:milk_app/ui/screens/loginSystem/forgotPasswordPage/changePassword/widgets/confirmPasswordTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/forgotPasswordPage/changePassword/widgets/passwordTextField.dart';

class ChangePassword extends StatelessWidget {
  final String email;
  const ChangePassword({Key key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50.0,),
              PasswordTextfield(),
              SizedBox(height: 20.0,),
              ConfirmPasswordTextField(),
              SizedBox(height: 30.0,),
              ConfirmButton(email: email,),
            ],
          ),
        ),
      )
    );
  }
}
