import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/mainAppInterface/allOrders/util/createOrdersList.dart';

class AllOrders extends StatefulWidget {
  @override
  _AllOrdersState createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  @override
  Widget build(BuildContext context) {
    Future data = AllOrdersList.createAllOrdersList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("All Orders"),
      ),
      body: FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            List list = snapshot.data;
            return _body(list);
          }
          else{
            return Center(child: CircularProgressIndicator(backgroundColor: Colors.black,),);
          }
        },
      ),
    );
  }

  Widget _body(List list){
    return Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: AllOrdersList.dictionary.length,
          itemBuilder: (BuildContext context, int index){
            return _card(index, list);
          },
        )
    );
  }

  Widget _card(int index, List list){
    List<Widget> widgetList = new List<Widget>();
    for(int i = 0; i < list[index]["plans"].length; i++){
      widgetList.add(_table(list[index]["plans"][i]));
    }
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
        ),
        elevation: 4.0,
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${index + 1}. ${list[index]['name']}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0
                ),
              ),
              Center(
                child: Container(
                  child: Column(
                    children: widgetList,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                alignment: Alignment.bottomRight,
                child: text(
                  "Total Estimated Amount:    ₹ ${list[index]["totalAmount"]}",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _table(Map map){
    return new Center(
      child: Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10.00)
        ),
        child: Table(
          columnWidths: {
            0 : FractionColumnWidth(0.4),
            1 : FractionColumnWidth(0.1),
            2 : FractionColumnWidth(0.4),
          },
          children: [
            _tableRow("Product Name", ":", map['productName']),
            _tableRow("Product quantity", ":", map['qty']),
            _tableRow("Plan Start Date", ":", map['startDate']),
            _tableRow("Plan End Date", ":", map['endDate']),
            _tableRow("Estimated Amount", ":", map['amount']),
          ],
        ),
      ),
    );
  }

  TableRow _tableRow(String c1, String c2, String c3){
    return TableRow(
        children: [
          Container(padding: EdgeInsets.only(left: 10.0) ,margin: EdgeInsets.symmetric(vertical: 10.0), child: text(c1),),
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
}
