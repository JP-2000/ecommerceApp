import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dates extends StatefulWidget {
  static DateTime startDateTime = DateTime.now().add(Duration(days: 1));
  static DateTime endDateTime;
  static var noOfDays;
  final Function onChanged;
  const Dates({Key key, this.onChanged}) : super(key: key);
  @override
  _DatesState createState() => _DatesState();
}

class _DatesState extends State<Dates> {
  @override
  Widget build(BuildContext context) {
    if(Dates.endDateTime == null) {
      Dates.noOfDays = Dates.startDateTime.difference(Dates.startDateTime);
    }
    else{
      Dates.noOfDays = Dates.endDateTime.add(Duration(days: 1)).difference(Dates.startDateTime);
    }

    return WillPopScope(
      onWillPop: () async {
        Dates.startDateTime = DateTime.now().add(Duration(days: 1));
        Dates.endDateTime = null;
        return true;
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 17.5,vertical: 10.0),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Start from: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0,),
                _startDate(context),
              ],
            ),
            SizedBox(width: 30.0,),
            Column(
              children: <Widget>[
                Text(
                  "End At: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10.0,),
                _endDate(context)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _startDate(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.center,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 3.0),
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              Dates.startDateTime == null? "-":
              DateFormat("dd").format(Dates.startDateTime),
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(width: 8.0,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  Dates.startDateTime == null? "":
                  DateFormat("MMM y").format(Dates.startDateTime),
                  style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  Dates.startDateTime == null? "":
                  DateFormat("EEEE").format(Dates.startDateTime),
                  style: TextStyle(
                    fontWeight: FontWeight.w100
                  ),
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: Dates.startDateTime,
          firstDate: DateTime.now().add(Duration(days: 1)),
          lastDate: DateTime(2021),
        ).then((date) {
          setState(() {
            if(date != null){
              Dates.startDateTime = date;
              if(Dates.endDateTime != null){
                String temp = Dates.endDateTime.add(Duration(days: 1)).difference(Dates.startDateTime).inDays.toString();
                if(int.parse(temp) < 1){
                  Dates.endDateTime = Dates.startDateTime;
                }
              }
            }
//            Product.getStartDate(value:  DateFormat("dd/MM/y").format(Dates.start_date_time),);
          });
        });
      },
    );
  }

  Widget _endDate(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.center,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 3.0),
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(Dates.endDateTime == null? "-":
              DateFormat("dd").format(Dates.endDateTime) ,
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(width: 8.0,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(Dates.endDateTime == null? "":
                  DateFormat("MMM y").format(Dates.endDateTime),
                  style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),
                ),
                Text(Dates.endDateTime == null? "":
                  DateFormat("EEEE").format(Dates.endDateTime),
                  style: TextStyle(
                      fontWeight: FontWeight.w100
                  ),
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: Dates.endDateTime == null? Dates.startDateTime : Dates.endDateTime,
          firstDate: Dates.startDateTime,
          lastDate: DateTime(2021),
        ).then((date) {
          setState(() {
            if(date != null){
              Dates.endDateTime = date;
            }
          });
        });
      },
    );
  }

}
