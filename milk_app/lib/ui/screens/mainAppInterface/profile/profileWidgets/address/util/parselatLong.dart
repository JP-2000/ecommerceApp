import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/addressWidgets/userMap.dart';

Future parseLatLong() async {
  print("*");
  print(UserMap.latLong);
  UserMap.currentLat = "";
  UserMap.currentLong = "";
  int counter = 0;
  for(int i = 0; i < UserMap.latLong.length; i++){
    if(UserMap.latLong[i] == " " ){
      counter = counter + 1;
      continue;
    }
    if(counter == 0){
      UserMap.currentLat = UserMap.currentLat + UserMap.latLong[i];
    }
    else{
      UserMap.currentLong = UserMap.currentLong + UserMap.latLong[i];
    }
  }

  print(UserMap.currentLat);
  print(UserMap.currentLong);
}