import 'package:http/http.dart' as http;
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/confirmPasswordTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/emailTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/firstNameTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/lastNameTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/passwordTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/phoneTextField.dart';
import 'package:milk_app/util/data.dart';

void addUser({
  String firstName,
  String lastName,
  String email,
  String phone,
  String password
}) {
  var url="http://" + Data.ipAddress + "/test/users/adddata.php";
  http.post(url,body: {
    "firstname": firstName,
    "lastname": lastName,
    "email": email,
    "phone": phone,
    "password": password,
  });
  FirstNameTextField.firstName = null;
  LastNameTextField.lastName = null;
  EmailTextField.email = null;
  PhoneTextField.phone = null;
  PasswordTextField.password = null;
  ConfirmPasswordTextField.password = null;

}