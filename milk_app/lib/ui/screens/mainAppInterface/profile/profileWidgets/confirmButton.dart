import 'package:flutter/material.dart';
import 'package:milk_app/util/updateProfile.dart';

class ConfirmButton extends StatelessWidget {
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
          child: Text("Confirm", style: TextStyle(color: Colors.black87,
              fontWeight: FontWeight.w800),),
        ),
      ),
      onTap: () {
        updateProfile(context: context);
      },
    );
  }
}
