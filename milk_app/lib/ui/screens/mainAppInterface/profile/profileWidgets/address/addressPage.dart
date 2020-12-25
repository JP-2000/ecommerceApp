import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/cityTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/houseTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/landMarkTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/localityTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/nextButton.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/pincodeTextField.dart';

class Address extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address"),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    Text("Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                    HouseTextField(),
                    LocalityTextField(),
                    CityTextField(),
                    LandMarkTextField(),
                    PincodeTextField(),
                    NextButton()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
