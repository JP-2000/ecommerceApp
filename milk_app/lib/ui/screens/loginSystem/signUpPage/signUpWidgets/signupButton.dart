import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginPage.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/confirmPasswordTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/emailTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/firstNameTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/lastNameTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/passwordTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/phoneTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/util/checkSignUpDetails.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
        ),
        elevation: 5.0,
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
                width: 2.0,
                color: Colors.grey
            ),
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
          child: Text("Signup", style: TextStyle(color: Colors.black87,
              fontWeight: FontWeight.w800),),
        ),
      ),
      onTap: () {
        RegFormFields.isAnyFieldNull = true;
        RegFormFields.isEmailRegistered = true;
        RegFormFields.isPhoneLengthAcceptable = false;
        RegFormFields.arePasswordsSame = false;
        chekSignUpDetails(
          context: context,
          users: Login.usersList,
          firstName: FirstNameTextField.firstName,
          lastName: LastNameTextField.lastName,
          email: EmailTextField.email,
          phone: PhoneTextField.phone,
          password: PasswordTextField.password,
          confirmPassword: ConfirmPasswordTextField.password,
        );
        if(RegFormFields.isAnyFieldNull == true){
          Scaffold.of(context).showSnackBar(message("Fill Form thoroughly"));
        }
        else{
          if(RegFormFields.isEmailRegistered == true){
            Scaffold.of(context).showSnackBar(message("Email Already Registred"));
          }
          else{
            if(RegFormFields.isPhoneLengthAcceptable == false){
              Scaffold.of(context).showSnackBar(message("Invalid Phone Number"));
            }
            else{
              if(RegFormFields.arePasswordsSame == false){
                Scaffold.of(context).showSnackBar(message("Passwords do not match"));
              }
            }
          }
        }

      },
    );
  }

  Widget message(String text){
    return SnackBar(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
      ),
      elevation: 100.0,
      behavior: SnackBarBehavior.floating,
      content: Container(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.0
          ),
        ),
      ),
      duration: Duration(milliseconds: 1000),
    );
  }
}
