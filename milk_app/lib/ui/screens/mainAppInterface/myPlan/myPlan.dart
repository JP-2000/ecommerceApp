import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:milk_app/network/network.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/util/checkUser.dart';
import 'package:milk_app/ui/screens/mainAppInterface/home/homeWidgets/productsListView.dart';
import 'package:milk_app/util/cancelOrder.dart';
import 'package:milk_app/util/data.dart';

class MyPlan extends StatefulWidget {
  static List ordersList;
  static bool details = false;
  static int contentIndex;
  static List<dynamic> myOrdersList = List<dynamic>();
  @override
  _MyPlanState createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  @override
  Widget build(BuildContext context) {
    Future data = Network.getOrders();
    return WillPopScope(
      onWillPop: () async {
        MyPlan.contentIndex = null;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Plan"),
        ),
        body: FutureBuilder(
          future: data,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData) {
              MyPlan.ordersList = snapshot.data.posts;
              if(MyPlan.myOrdersList != null){
                MyPlan.myOrdersList.clear();
              }
              for(int i = 0; i < MyPlan.ordersList.length; i++){
                if(User.uid.toString() == MyPlan.ordersList[i].uid){
                  MyPlan.myOrdersList.add(MyPlan.ordersList[i]);
                }
              }
              return Container(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: MyPlan.myOrdersList.length,
                  itemBuilder: (BuildContext context,int index){
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      elevation: 5.0,
                      child:
                      MyPlan.contentIndex != index ?
                      content(MyPlan.myOrdersList[index], index) : detailedContent(MyPlan.myOrdersList[index])
                    );
                  },
                ),
              );
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }

  Widget content(var instance, int index) {
    String productName;
    String productPrice;
    for(int i = 0; i < ProductsListView.productsList.length; i++){
      if(instance.productId == ProductsListView.productsList[i].productId){
        productName = ProductsListView.productsList[i].productName;
        productPrice = ProductsListView.productsList[i].price;
      }
    }
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage(Data.imagesList2[int.parse(instance.productId) - 1]),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    productName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0
                    ),
                  ),
                ),
                Text("₹$productPrice"),
                SizedBox(height: 10.0,),
                Text(
                  "Total Amount: ₹${instance.totalAmount}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 80.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text(
                      "Show Details",
                      style: TextStyle(
                        decoration: TextDecoration.underline
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        MyPlan.contentIndex = index;
                      });
                    },
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
  
  Widget detailedContent(var instance) {
    String productName;
    String productPrice;
    int i;
    for(i = 0; i < ProductsListView.productsList.length; i++){
      if(instance.productId == ProductsListView.productsList[i].productId){
        productName = ProductsListView.productsList[i].productName;
        productPrice = ProductsListView.productsList[i].price;
      }
    }
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage(Data.imagesList2[int.parse(instance.productId) - 1]),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(5.00)
            ),
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            child: Center(
              child: Table(
                columnWidths: {
                  0 : FractionColumnWidth(0.4),
                  1 : FractionColumnWidth(0.1),
                  2 : FractionColumnWidth(0.4),
                },
                children: [
                  _tableRow("Product Name", ":", productName),
                  _tableRow("Product Price", ":", productPrice),
                  _tableRow("Product quantity", ":", instance.qty),
                  _tableRow("Plan Start Date", ":", instance.startDate),
                  _tableRow("Plan End Date", ":", instance.endDate),
                  _tableRow("Days Selected", ":", instance.days),
                  _tableRow("Total Amount", ":", instance.totalAmount),
                ],
              ),
            )
          ),
          cancelButton(instance.orderId),
          Container(
            alignment: Alignment.bottomRight,
            child: InkWell(
              child: Text(
                "Show less details",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: (){
                setState(() {
                  MyPlan.contentIndex = null;
                });
              },
            ),
          )
        ],
      ),
    );
  }
  
  TableRow _tableRow(String c1, String c2, String c3){
    return TableRow(
        children: [
          Container(margin: EdgeInsets.symmetric(vertical: 10.0), child: text(c1),),
          Container(margin: EdgeInsets.symmetric(vertical: 10.0), child: text(c2),),
          Container(margin: EdgeInsets.symmetric(vertical: 10.0), child: text(c3),)
        ]
    );
  }

  Widget text(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600
      ),
    );
  }

  Widget cancelButton(String orderId){
    return InkWell(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
        ),
        elevation: 5.0,
        child: Container(
          alignment: Alignment.center,
          width: 300.0,
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
                width: 2.0,
                color: Colors.grey
            ),
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
          child: Text("Cancel Plan", style: TextStyle(color: Colors.black87,
              fontWeight: FontWeight.w800),),
        ),
      ),
      onTap: () {
        cancelOrder(orderId: orderId);
        setState(() {});
      },
    );
  }
}
