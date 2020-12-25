import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Days extends StatefulWidget {
  static int opt = 0;
  static String daysSelected;
  static Map<String, bool> days = {
    'sun' : false,
    'mon' : false,
    'tue' : false,
    'wed' : false,
    'thu' : false,
    'fri' : false,
    'sat' : false
  };
  @override
  _DaysState createState() => _DaysState();
}

class _DaysState extends State<Days> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Days.opt = 0;
        Days.days['sun'] = false;
        Days.days['mon'] = false;
        Days.days['tue'] = false;
        Days.days['wed'] = false;
        Days.days['thu'] = false;
        Days.days['fri'] = false;
        Days.days['sat'] = false;
        return true;
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 17.5, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Days", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                dailyButton(),
                alternateDaysButton(),
                selectDaysButton()
              ],
            ),
            _daysSelection(),
          ],
        ),
      ),
    );
  }
  Widget dailyButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        alignment: Alignment.center,
        height: 35.0,
        width: 110.0,
        decoration: BoxDecoration(
          color: Days.opt == 1 ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          "Daily",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Days.opt == 1 ? Colors.white:Colors.black
          ),
        ),
      ),
      onTap: () {
        setState(() {
          Days.opt = 1;
          Days.daysSelected = "daily";
          Days.days.forEach((key, value) {
            Days.days[key] = true;
          });
        });
      },
    );
  }
  Widget alternateDaysButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        alignment: Alignment.center,
        height: 35.0,
        width: 110.0,
        decoration: BoxDecoration(
          color: Days.opt == 2 ? Colors.black: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          "Alternate days",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Days.opt == 2 ? Colors.white:Colors.black
          ),
        ),
      ),
      onTap: () {
        setState(() {
          Days.opt = 2;
          Days.daysSelected = "alternate_days";
        });
      },
    );
  }
  Widget selectDaysButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        alignment: Alignment.center,
        height: 35.0,
        width: 110.0,
        decoration: BoxDecoration(
          color: Days.opt == 3 ? Colors.black: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          "Select",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Days.opt == 3 ? Colors.white:Colors.black
          ),
        ),
      ),
      onTap: () {
        setState(() {
          Days.opt = 3;
          Days.daysSelected = "selected_days";
        });
      },
    );
  }

  Widget _daysSelection() {
    return Container(
      child: Days.opt == 3 ?
      Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _column("Sun"),
            _column("Mon"),
            _column("Tue"),
            _column("Wed"),
            _column("Thu"),
            _column("Fri"),
            _column("Sat")
          ],
        )
      )
          :
      Container(),
    );
  }

  Widget _column(String day) {
    return Column(
      children: <Widget>[
        _checkbox(day),
        Text(day),
      ],
    );
  }

  Widget _checkbox(String day){
    if(day == "Sun"){
      return Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        activeColor: Colors.white,
        checkColor: Colors.black87,
        value: Days.days['sun'],
        onChanged: (bool value) {
          setState(() {
            Days.days['sun'] = value;
          });
        },
      );
    }
    else if(day == "Mon") {
      return Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        activeColor: Colors.white,
        checkColor: Colors.black87,
        value: Days.days['mon'],
        onChanged: (bool value) {
          setState(() {
            Days.days['mon'] = value;
          });
        },
      );
    }
    else if(day == "Tue") {
      return Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        activeColor: Colors.white,
        checkColor: Colors.black87,
        value: Days.days['tue'],
        onChanged: (bool value) {
          setState(() {
            Days.days['tue'] = value;
          });
        },
      );
    }
    else if(day == "Wed") {
      return Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        activeColor: Colors.white,
        checkColor: Colors.black87,
        value: Days.days['wed'],
        onChanged: (bool value) {
          setState(() {
            Days.days['wed'] = value;
          });
        },
      );
    }
    else if(day == "Thu") {
      return Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        activeColor: Colors.white,
        checkColor: Colors.black87,
        value: Days.days['thu'],
        onChanged: (bool value) {
          setState(() {
            Days.days['thu'] = value;
          });
        },
      );
    }
    else if(day == "Fri") {
      return Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        activeColor: Colors.white,
        checkColor: Colors.black87,
        value: Days.days['fri'],
        onChanged: (bool value) {
          setState(() {
            Days.days['fri'] = value;
          });
        },
      );
    }
    else if(day == "Sat") {
      return Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        activeColor: Colors.white,
        checkColor: Colors.black87,
        value: Days.days['sat'],
        onChanged: (bool value) {
          setState(() {
            Days.days['sat'] = value;
          });
        },
      );
    }
    else{
      return Container(
        child: Text("Error"),
      );
    }
  }
}