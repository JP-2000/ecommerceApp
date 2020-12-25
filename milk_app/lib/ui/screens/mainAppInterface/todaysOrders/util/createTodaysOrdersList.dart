import 'package:milk_app/network/network.dart';
import 'package:intl/intl.dart';

class TodaysOrdersList{
  static Map dictionary = new Map();
  static List ordersList;
  static List usersList;
  static List productsList;
  static List list;

  static Future createTodaysOrdersList() async{
    await createAllOrdersList();
    for(int i = 0; i < list.length; i++){
      for(int k = 0; k < list[i]["plans"].length; k++) {
        for (var j in list[i]["plans"]) {
          print(j);
          if (
          startDateFeasibility(j["startDate"])
              && endDateFeasibility(j["endDate"])
              && daysFeasibility(
              j["startDate"], j["endDate"], j["days"], j["daysValues"])
          ) {
            continue;
          }
          else {
            list[i]["plans"].remove(j);
            break;
          }
        }
      }
    }
    print(list);
    return list;
  }

  static bool endDateFeasibility(String date){
    DateTime endDate = _convertStringToDateTime(date);
    DateTime today = DateTime.now();
    int difference = int.parse(endDate.difference(today).inDays.toString()) + 1;
    if(difference < 0){
      return false;
    }
    else{
      return true;
    }
  }
  static bool startDateFeasibility(String date){
    DateTime startDate = _convertStringToDateTime(date);
    DateTime today = DateTime.now();
    int difference = int.parse(today.difference(startDate).inDays.toString()) + 1;
    print(difference);
    if(difference < 0){
      return false;
    }
    else{
      return true;
    }
  }
  static bool daysFeasibility(String startDate, String endDate, String days, String daysValues){
    if(days == "daily"){
      print("daily");
      return true;
    }
    else if(days == "selected_days"){
      print("selected_days");
      return selectedDaysFeasibility(daysValues);
    }
    else{
      print(days);
      print(daysValues);
      return alternateDaysFeasibility(_convertStringToDateTime(daysValues), _convertStringToDateTime(endDate));
    }
  }
  static bool alternateDaysFeasibility(DateTime daysValues, DateTime endDate){
    int difference = int.parse(endDate.difference(daysValues).inDays.toString());
    List list = new List();
    do{
      print(difference);
      list.add(DateFormat("dd/MM/y").format(daysValues));
      daysValues = daysValues.add(Duration(days: 2));
      difference = int.parse(endDate.difference(daysValues).inDays.toString());
      print(list);
    }while(difference >= 0);
    print(list);
    if(list.contains(DateFormat("dd/MM/y").format(DateTime.now()))){
      return true;
    }
    else{
      return false;
    }
  }
  static bool selectedDaysFeasibility(String daysValues){
    List list = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    List list2 = new List();
    for(int i = 0; i < daysValues.length; i++){
      if(daysValues[i] == "1"){
        list2.add(list[i]);
      }
    }
    print(list2);
    String today = DateFormat("EEEE").format(DateTime.now());
    print(today);
    if(list2.contains(today)){
      return true;
    }
    else{
      return false;
    }
  }

  static DateTime _convertStringToDateTime(String date){
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
    String formattedDate = year + "-" + month + "-" + day;
    return DateTime.parse(formattedDate);
  }

  /*---------------------------------------------------------*/
  static Future _check() async {
    if (dictionary.isNotEmpty) {
      dictionary.clear();
    }
  }

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
    return list;
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
          "days": ordersList[i].days,
          "daysValues": ordersList[i].daysValues,
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
              "days": ordersList[i].days,
              "daysValues": ordersList[i].daysValues,
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
//    _addTotalAmount();
  }
//  static Future _addTotalAmount() async {
//    for(int i = 0; i < list.length; i++){
//      list[i]["totalAmount"] = _getTotalAmount(i);
//    }
//  }
//  static double _getTotalAmount(int index){
//    double totalAmount = 0.0;
//    for(int j = 0; j < list[index]["plans"].length; j++){
//      totalAmount = totalAmount + double.parse(list[index]["plans"][j]["amount"]);
//    }
//    return totalAmount;
//  }
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