import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginPage.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/util/checkUser.dart';
import 'package:milk_app/ui/screens/mainAppInterface/aboutUs/aboutUs.dart';
import 'package:milk_app/ui/screens/mainAppInterface/allOrders/allOrders.dart';
import 'package:milk_app/ui/screens/mainAppInterface/myPlan/myPlan.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profile.dart';
import 'package:milk_app/ui/screens/mainAppInterface/todaysOrders/todayOrders.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5.0,
      child: Container(
        alignment: Alignment.topRight,
        margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Icon(
                  Icons.person,
                  size: 50.0,
                ),
                SizedBox(width: 10.0,),
                _drawerOptions("My Profile", context)
              ],
            ),
            SizedBox(height: 30.0,),
            _drawerOptions("My Plan", context),
            SizedBox(height: 30.0,),
            _drawerOptions("About Us", context),
            User.admin? SizedBox(height: 30.0,):Container(),
            User.admin? _drawerOptions("All Orders", context):Container(),
            User.admin? SizedBox(height: 30.0,):Container(),
            User.admin? _drawerOptions("Today's Orders", context):Container(),
            User.admin? SizedBox(height: 30.0,):Container(),
            User.admin? _drawerOptions("Lets Travel", context):Container(),
            User.admin? SizedBox(height: 30.0,):Container(),
            SizedBox(height: 30.0,),
            _drawerOptions("Logout", context),
          ],
        ),
      ),
    );
  }
  
  Widget _drawerOptions(String text, BuildContext context) {
    return InkWell(
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: (){
        if(text == "Logout"){
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Login()
              )
          );
        }
        if(text == "About Us"){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AboutUs()
              )
          );
        }
        if(text == "My Plan"){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyPlan()
              )
          );
          User.admin = false;
        }
        if(text == "My Profile"){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Profile()
              )
          );
        }
        if(text == "All Orders"){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AllOrders()
              )
          );
        }
        if(text == "Today's Orders"){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TodaysOrders(),
              )
          );
        }
        if(text == "Lets Travel"){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AllOrders()
              )
          );
        }

      },
    );
  }
}
