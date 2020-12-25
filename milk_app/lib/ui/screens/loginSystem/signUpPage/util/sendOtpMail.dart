import 'package:http/http.dart' as http;
import 'package:milk_app/util/data.dart';

void sendOtpMail(int otp) {
  var url="http://" + Data.ipAddress + "/test/email.php";
  http.post(url,body: {
    "otp" : otp.toString()
  });
}