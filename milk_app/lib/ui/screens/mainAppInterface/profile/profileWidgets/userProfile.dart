import 'package:flutter/material.dart';
import 'package:milk_app/network/network.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/util/checkUser.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/textStyles.dart';
import 'editButton.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    Future data = Network.getUsers();
    String firstName;
    String lastName;
    String phone;
    return FutureBuilder(
      future: data,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          List usersList = snapshot.data.posts;
          int i;
          for(i = 0; i < usersList.length; i++){
            if(User.uid.toString() == usersList[i].uid){
              firstName = usersList[i].firstName;
              lastName = usersList[i].lastName;
              phone = usersList[i].phone;
              break;
            }
          }
          print(usersList);
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textstyle1("Profile"),
                        SizedBox(height: 15.0,),
                        textstyle2("$firstName $lastName"),
                        SizedBox(height: 10.0,),
                        textstyle2("$phone")
                      ],
                    ),
                    editButton("profile", context)
                  ],
                ),
              ),
            ),
          );
        }
        else{
          return Center(child: CircularProgressIndicator(backgroundColor: Colors.black,),);
        }
      },
    );
  }
}
