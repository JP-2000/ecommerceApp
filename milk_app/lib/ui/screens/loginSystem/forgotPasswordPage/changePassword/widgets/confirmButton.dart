import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/forgotPasswordPage/changePassword/util/checkPasswordConditions.dart';
import 'package:milk_app/ui/screens/loginSystem/forgotPasswordPage/changePassword/widgets/confirmPasswordTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/forgotPasswordPage/changePassword/widgets/passwordTextField.dart';

class ConfirmButton extends StatelessWidget {
  final String email;

  const ConfirmButton({Key key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
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
          child: Text("Confirm", style: TextStyle(color: Colors.black87,
              fontWeight: FontWeight.w800),),
        ),
      ),
      onTap: () {
        Bool.isAnyFieldNull = true;
        Bool.arePasswordsSame = false;
        Bool.isPasswordLengthValid = false;
        checkPasswordConditions(
          email: email,
          password: PasswordTextfield.password,
          confirmPassword: ConfirmPasswordTextField.confirmPassWord,
          context: context
        );
        if(Bool.isAnyFieldNull == true){
          Scaffold.of(context).showSnackBar(message("Fill all fields"));
        }
        else{
          if(Bool.arePasswordsSame == false){
            Scaffold.of(context).showSnackBar(message("Passwords Do Not Match"));
          }
          else{
            if(Bool.isPasswordLengthValid == false){
              Scaffold.of(context).showSnackBar(message("Password too short"));
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
