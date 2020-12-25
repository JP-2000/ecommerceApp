import 'dart:convert';
import 'package:milk_app/model/addressModel.dart';
import 'package:milk_app/model/ordersModel.dart';
import 'package:milk_app/model/productsModel.dart';
import 'package:milk_app/model/userProfilesModel.dart';
import 'package:milk_app/model/usersModel.dart';
import 'package:http/http.dart';
import 'package:milk_app/util/data.dart';

class Network {

  static Future getProfiles() async{
    var url = "http://" + Data.ipAddress + "/test/userProfiles/getData.php";
    Response response = await get(Uri.encodeFull(url));
//    print(Uri.encodeFull(url));
    if(response.statusCode == 200) {
//      print(response.body);
      return UserProfilesModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("oof Error");
    }
  }

  static Future getAddresses() async{
    var url = "http://" + Data.ipAddress + "/test/addresses/get_addresses.php";
    Response response = await get(Uri.encodeFull(url));
//    print(Uri.encodeFull(url));
    if(response.statusCode == 200) {
//      print(response.body);
      return AddressModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("oof Error");
    }
  }

  static Future getProducts() async{
    var url = "http://" + Data.ipAddress + "/test/products/get_data.php";
    Response response = await get(Uri.encodeFull(url));
//    print(Uri.encodeFull(url));
    if(response.statusCode == 200) {
//      print(response.body);
      return ProductsModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("oof Error");
    }
  }

  static Future getOrders() async{
    var url = "http://" + Data.ipAddress + "/test/orders/get_orders.php";
    Response response = await get(Uri.encodeFull(url));
//    print(Uri.encodeFull(url));
    if(response.statusCode == 200) {
//      print(response.body);
      return OrdersModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("oof Error");
    }
  }

  static Future getUsers() async{
    var url = "http://" + Data.ipAddress + "/test/users/getdata.php";
    Response response = await get(Uri.encodeFull(url));
//    print(Uri.encodeFull(url));
    if(response.statusCode == 200) {
//      print(response.body);
      return UsersModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("oof Error");
    }
  }
}