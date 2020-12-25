import 'package:http/http.dart' as http;
import 'package:milk_app/util/data.dart';

void addOrder({
  int uid,
  String productId,
  int qty,
  String startDate,
  String endDate,
  String days,
  String daysValues,
  int totalAmount
}){
  var url="http://" + Data.ipAddress + "/test/orders/add_orders.php";
  http.post(url,body: {
    "uid": uid.toString(),
    "product_id": productId,
    "qty": qty.toString(),
    "start_date": startDate,
    "end_date": endDate,
    "days": days,
    "days_values": daysValues,
    "total_amount": totalAmount.toString()
  });
  print("Successful");
}