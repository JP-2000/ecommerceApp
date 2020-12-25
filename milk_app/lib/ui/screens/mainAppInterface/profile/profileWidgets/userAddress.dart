import 'package:flutter/material.dart';
import 'package:milk_app/network/network.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/util/checkUser.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/editButton.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/textStyles.dart';

class UserAddress extends StatefulWidget {
  static bool present = false;
  @override
  _UserAddressState createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
  @override
  Widget build(BuildContext context) {
    Future data = Network.getAddresses();
    String house;
    String locality;
    String city;
    String landmark;
    String pincode;
    return WillPopScope(
      onWillPop: () async {
        UserAddress.present = false;
        return true;
      },
      child: FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            List addressesList = snapshot.data.posts;
            int i;
            for(i = 0;i < addressesList.length; i++){
              if(User.uid.toString() == addressesList[i].uid){
                UserAddress.present = true;
                house = addressesList[i].house;
                locality = addressesList[i].locality;
                city = addressesList[i].city;
                landmark = addressesList[i].landmark;
                pincode = addressesList[i].pincode;
                break;
              }
            }
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserAddress.present == true?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textstyle1("Address"),
                          SizedBox(height: 15.0,),
                          textstyle2("$house"),
                          SizedBox(height: 10.0,),
                          textstyle2("$locality"),
                          SizedBox(height: 10.0,),
                          textstyle2("$city"),
                          SizedBox(height: 10.0,),
                          textstyle2("$landmark"),
                          SizedBox(height: 10.0,),
                          textstyle2("$pincode"),
                        ],
                      )
                          :
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textstyle1("Address"),
                              SizedBox(height: 15.0,),
                              textstyle2("Please add Address")
                            ],
                          ),
                      editButton("address", context)
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
      ),
    );
  }
}
