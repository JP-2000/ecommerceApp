import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/cityTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/confirmbutton.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/houseTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/landMarkTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/localityTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/pincodeTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/userMap.dart';


class NextButton extends StatelessWidget {

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
          child: Text("Next", style: TextStyle(color: Colors.black87,
              fontWeight: FontWeight.w800),),
        ),
      ),
      onTap: () {
        if(
            HouseTextField.house != null &&
            LocalityTextField.locality != null &&
            CityTextField.city != null &&
            LandMarkTextField.landmark != null &&
            PincodeTextField.pincode != null
        ){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlackScreen()
              )
          );
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserMap()
              )
          );
        }
      },
    );
  }
}
