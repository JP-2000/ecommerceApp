import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/userAddress.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/userProfile.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            UserProfile(),
            UserAddress()
          ],
        ),
      ),
    );
  }
}
