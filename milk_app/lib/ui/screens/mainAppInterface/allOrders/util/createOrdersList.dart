import 'package:milk_app/network/network.dart';
import 'package:intl/intl.dart';

class AllOrdersList{
  static Map dictionary = new Map();
  static List ordersList;
  static List usersList;
  static List productsList;
  static List list;

  static Future createAllOrdersList() async{
    await _check();
    Future userData = Network.getUsers();
    Future productsData = Network.getProducts();
    Future ordersData = Network.getOrders();
    await userData.then((value) async{
      usersList = value.posts;
      await productsData.then((value) async{
        productsList = value.posts;
        await ordersData.then((value) async{
          ordersList = value.posts;
          await _add();
          _format();
        });
      });
    });
    print(list);
    return list;
  }

  static Future createTodaysOrdersList() async{
    await createAllOrdersList();
    for(int i = 0; i < list.length; i++){
      for(int j = 0; j < list[i]["plans"].length; j++){
        if(feasibility(list[i]["plans"][j]["endDate"])){
          continue;
        }
        else{
          print(list[i]["plans"][j]);
        }
      }
    }
    print(list);
    return "oof";
  }
  static bool feasibility(String date){
    String year = "";
    String month = "";
    String day = "";
    for(int i = 0; i < 2; i++){
      day += date[i];
    }
    for(int i = 3; i < 5; i++){
      month += date[i];
    }
    for(int i = 6; i < 10; i++){
      year += date[i];
    }
    String formattedDate= year + "-" + month + "-" + day;
    DateTime endDate = DateTime.parse(formattedDate);
    DateTime today = DateTime.now();
    int difference = int.parse(endDate.difference(today).inDays.toString()) + 1;
    print(difference);
    if(difference < 0){
      return false;
    }
    else{
      return true;
    }
  }
  static Future _check() async {
    if (dictionary.isNotEmpty) {
      dictionary.clear();
    }
  }

  static Future _add() async{
    for(int i = 0; i < ordersList.length; i++){
      int uid = int.parse(ordersList[i].uid);
      if(dictionary.containsKey(uid)){
        dictionary[uid]['plans'][ordersList[i].orderId] = {
          "productName": _getProductName(ordersList[i].productId),
          "qty": ordersList[i].qty,
          "startDate": ordersList[i].startDate,
          "endDate": ordersList[i].endDate,
          "amount": ordersList[i].totalAmount
        };
      }
      else{
        dictionary[uid] = {
          "name": _getName(uid),
          "plans": {
            ordersList[i].orderId: {
              "productName": _getProductName(ordersList[i].productId),
              "qty": ordersList[i].qty,
              "startDate": ordersList[i].startDate,
              "endDate": ordersList[i].endDate,
              "amount": ordersList[i].totalAmount
            }
          }
        };
      }
    }
  }

  static void _format(){
    list = dictionary.values.toList();
    for(int i = 0; i < list.length; i++){
      list[i]["plans"] = list[i]["plans"].values.toList();
    }
    _addTotalAmount();
  }

  static Future _addTotalAmount() async {
    for(int i = 0; i < list.length; i++){
      list[i]["totalAmount"] = _getTotalAmount(i);
    }
  }

  static double _getTotalAmount(int index){
    double totalAmount = 0.0;
    for(int j = 0; j < list[index]["plans"].length; j++){
      totalAmount = totalAmount + double.parse(list[index]["plans"][j]["amount"]);
    }
    return totalAmount;
  }

  static String _getProductName(String productId){
    String productName;
    for(int i = 0; i < productsList.length; i++){
      if(productsList[i].productId == productId){
        productName = productsList[i].productName;
        break;
      }
    }
    return productName;
  }

  static String _getName(int uid) {
    String name;
    for (int i = 0; i < usersList.length; i++) {
      if (usersList[i].uid == uid.toString()) {
        name = usersList[i].firstName + usersList[i].lastName;
        break;
      }
    }
    return name;
  }
}