import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/util/parselatLong.dart';
import 'package:milk_app/ui/screens/mainAppInterface/profile/profileWidgets/address/util/updateAddress.dart';

import 'package:webview_flutter/webview_flutter.dart';

class UserMap extends StatelessWidget {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  Future<Position> _getLocation() async {
    Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }
  static  String initialLat;
  static String initialLong;
  static String latLong = "test";
  static  String currentLat = "";
  static String currentLong = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("User Map"),
        ),
        body: FutureBuilder(
          future: _getLocation(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              initialLat = snapshot.data.latitude.toString();
              initialLong = snapshot.data.longitude.toString();
              return _webView(context);
            }
            else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: Container(
          height: 75,
          width: 75,
          margin: EdgeInsets.only(bottom: 5.0),
          child: FittedBox(
            child: FloatingActionButton(
              child: Icon(Icons.done_all, color: Colors.white,),
              backgroundColor: Colors.blueAccent.withOpacity(0.5),
              onPressed: () async {
//                updateAddress(context: context);
                _jsCommand();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _webView(BuildContext context){
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          WebView(
//            initialUrl: "http://127.0.0.1:8000/",
            initialUrl: "http://192.168.0.104/test/html/userMap2.php?lat=" + initialLat + "&long=" + initialLong,
            onWebViewCreated: (controller) {
              _controller.complete(controller);
            },
            javascriptMode: JavascriptMode.unrestricted,
            gestureNavigationEnabled: true,
            javascriptChannels: <JavascriptChannel>[
              _fetchLatLong(context),
            ].toSet(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 35,
            color: Colors.white,
          ),
          _gpsButton(context)
        ],
      ),
    );
  }

  Widget _gpsButton(BuildContext context){
    return Container(
//      color: Colors.yellow,
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.0)
              ),
              margin: EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.0),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.6),
                        width: 1.5
                    )
                ),
                height: 50,
                width: 50,
                child: Icon(Icons.gps_fixed, size: 35, color: Colors.black.withOpacity(0.8),),
              ),
              elevation: 3.0,
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserMap()
                  )
              );
            },
          )
        ],
      ),
    );
  }

  Future _jsCommand() async {
    await _controller.future.then((webViewController) {
      webViewController
          .evaluateJavascript('TopBarJsChannel.postMessage(document.title);');
    });
  }

  JavascriptChannel _fetchLatLong(BuildContext context) {
    return JavascriptChannel(
      name: 'TopBarJsChannel',
      onMessageReceived: (JavascriptMessage message) {
        latLong = message.message;
        parseLatLong();
        updateAddress(context: context);
      },
    );
  }
}


