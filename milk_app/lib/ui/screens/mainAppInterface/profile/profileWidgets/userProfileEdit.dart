import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/LastNameTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/firstNameTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/phoneTextField.dart';

import 'confirmButton.dart';

class UserProfileEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 100.0),
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
            ),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text("Edit Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                  FirstNameTextField(),
                  LastNameTextField(),
                  PhoneTextField(),
                  ConfirmButton()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
