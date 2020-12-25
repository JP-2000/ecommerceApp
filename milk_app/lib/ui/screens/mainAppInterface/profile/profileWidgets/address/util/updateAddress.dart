import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/util/checkUser.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profile.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/cityTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/houseTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/landMarkTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/localityTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/pincodeTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/userMap.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/userAddress.dart';
import 'package:http/http.dart' as http;
import 'package:milk_app/util/data.dart';

void updateAddress({BuildContext context}){
  var addUrl = "http://" + Data.ipAddress + "/test/addresses/add_addresses.php";
  var updateUrl = "http://" + Data.ipAddress + "/test/addresses/update_address.php";
  print(UserAddress.present);
  if(UserAddress.present == true){
//    print(User.uid.toString());
//    print(HouseTextField.house);
//    print(LocalityTextField.locality);
//    print(CityTextField.city);
//    print(LandMarkTextField.landmark);
//    print(PincodeTextField.pincode);
    print(UserMap.currentLat);
    print(UserMap.currentLong);

    http.post(updateUrl,body: {
      "uid": User.uid.toString(),
      "house": HouseTextField.house,
      "locality": LocalityTextField.locality,
      "city": CityTextField.city,
      "landmark": LandMarkTextField.landmark,
      "pincode": PincodeTextField.pincode,
      "latitude": UserMap.currentLat,
      "longitude": UserMap.currentLong
    });
  }
  else{
    http.post(addUrl,body: {
      "uid": User.uid.toString(),
      "house": HouseTextField.house,
      "locality": LocalityTextField.locality,
      "city": CityTextField.city,
      "landmark": LandMarkTextField.landmark,
      "pincode": PincodeTextField.pincode,
      "latitude": UserMap.currentLat,
      "longitude": UserMap.currentLong
    });
  }
  Navigator.pop(context);
  Navigator.pop(context);
  Navigator.pop(context);
  Navigator.pop(context);
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Profile()
      )
  );
}