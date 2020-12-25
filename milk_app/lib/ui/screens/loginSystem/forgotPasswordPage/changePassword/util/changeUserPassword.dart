import 'package:http/http.dart' as http;
import 'package:milk_app/util/data.dart';

void changeUserPassword({
  String email,
  String password
}) {
  var url = "http://" + Data.ipAddress + "/test/users/editPassword.php";
  http.post(url,body: {
    "email": email,
    "password": password
  });
}