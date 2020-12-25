import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/util/checkUser.dart';

import 'data.dart';

void cancelOrder({String orderId}){

  String date = DateFormat("dd/MM/y").format(DateTime.now());
  String time = DateFormat("jm").format(DateTime.now());
  print(time);
  var url = "http://" + Data.ipAddress + "/test/orders/delete_order.php";
  var url2 = "http://" + Data.ipAddress + "/test/orders/cancellations/add_cancellation.php";
  http.post(url,body: {
    "order_id" : orderId
  });
  http.post(url2,body: {
    "order_id" : orderId,
    "uid": User.uid.toString(),
    "date" : date,
    "time" : time,
  });
}
