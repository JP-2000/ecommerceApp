import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressPage.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/userProfileEdit.dart';

Widget editButton(String text, BuildContext context){
  return InkWell(
    child: Row(
      children: [
        Icon(Icons.edit, size: 15.0, color: Colors.blue,),
        Text("Edit")
      ],
    ),
    onTap: (){
      if(text == "profile"){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserProfileEdit()
            )
        );
      }
      if(text == "address"){
        print("address");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Address()
            )
        );
      }
    },
  );
}