import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/util/data.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.transparent.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage("assets/images/test_bg.jpg"),
                fit: BoxFit.cover
              )
            ),
            child: Column(
              children: [
                Center(
                    child: Text(
                      "\n \"Great health comes from nutrition\" \n ",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  child: Text(
                    Data.aboutUs[0],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  child: Text(
                    Data.aboutUs[1],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  child: Text(
                    Data.aboutUs[2],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  child: Text(
                    Data.aboutUs[3],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
