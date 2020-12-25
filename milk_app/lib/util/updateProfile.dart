import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:milk_app/ui/screens/loginSystem/loginPage/util/checkUser.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profile.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/LastNameTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/firstNameTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/phoneTextField.dart';
import 'package:milk_app/util/data.dart';

void updateProfile({BuildContext context}){
  var url = "http://" + Data.ipAddress + "/test/users/editdata.php";
  http.post(url,body: {
    "uid": User.uid.toString(),
    "firstname": FirstNameTextField.firstName,
    "lastname": LastNameTextField.lastName,
    "phone": PhoneTextField.phone.toString(),
  });
  Navigator.pop(context);
  Navigator.pop(context);
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Profile()
      )
  );
}