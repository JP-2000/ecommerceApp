import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/network/network.dart';
import 'package:milk_app/ui/screens/mainAppInterface/home/homeWidgets/quotesListView.dart';
import 'package:milk_app/ui/screens/mainAppInterface/home/util/checkUserProfile.dart';
import 'package:milk_app/util/data.dart';
import 'package:milk_app/ui/screens/mainAppInterface/home/homeWidgets/homeDrawer.dart';
import 'package:milk_app/ui/screens/mainAppInterface/home/homeWidgets/productsListView.dart';


class Home extends StatefulWidget {
  static List profilesList;
  static int uid;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List quotesList = Data.quotesList ;
  List images = Data.imagesList ;
  @override
  Widget build(BuildContext context) {
    Future data = Network.getProfiles();
    return WillPopScope(
      onWillPop: () async => false,
      child: FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            Home.profilesList = snapshot.data.posts;
            checkUserProfile();
            return Scaffold(
                appBar: AppBar(
                  title: Text("Home"),
                ),
                drawer: HomeDrawer(),
                body: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 80.0,
                      color: Colors.white.withOpacity(1.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10.0,),
                          QuotesListView(quotesList: quotesList, images: images,),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text(
                              "Products: ",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          ProductsListView(),
                        ],
                      ),
                    ),
                  ],
                )
            );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }
}