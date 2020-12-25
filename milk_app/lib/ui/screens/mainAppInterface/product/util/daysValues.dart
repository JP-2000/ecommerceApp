import 'package:milk_app/ui/screens/mainAppInterface/product/productWidgets/dates.dart';
import 'package:milk_app/ui/screens/mainAppInterface/product/productWidgets/days.dart';
import 'package:intl/intl.dart';

String daysValues(){
  String daysValues = '';
  if(Days.daysSelected == "alternate_days"){
    daysValues = "${DateFormat("dd/MM/y").format(Dates.startDateTime)}";
  }
  else{
    Days.days.forEach((key, value) {
      if(value == true) {
        daysValues = '${daysValues}1';
      }
      else if(value == false){
        daysValues = '${daysValues}0';
      }
    });
  }

  return daysValues;
}
