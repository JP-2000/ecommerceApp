import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpPage.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
          child: Text("Signup", style: TextStyle(color: Colors.black87,
              fontWeight: FontWeight.w800),),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SignUpPage()
            )
        );
//        Navigator.push(
//            context,
//            MaterialPageRoute(
//                builder: (context) => SignUp()
//            )
//        );
      },
    );
  }
}
