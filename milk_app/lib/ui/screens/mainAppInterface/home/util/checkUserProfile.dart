import 'package:milk_app/ui/screens/loginSystem/loginPage/util/checkUser.dart';
import 'package:milk_app/ui/screens/mainAppInterface/home/home.dart';

void checkUserProfile(){
  for(int i = 0; i < Home.profilesList.length; i++){
    if(Home.profilesList[i].uid == User.uid.toString()){
      if(Home.profilesList[i].profile == "admin"){
        User.admin = true;
      }
    }
  }
}