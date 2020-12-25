import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/network/network.dart';
import 'package:milk_app/ui/screens/mainAppInterface/product/productWidgets/bill.dart';
import 'package:milk_app/ui/screens/mainAppInterface/product/productWidgets/confirmButton.dart';
import 'package:milk_app/ui/screens/mainAppInterface/product/productWidgets/dates.dart';
import 'package:milk_app/ui/screens/mainAppInterface/product/productWidgets/days.dart';
import 'package:milk_app/ui/screens/mainAppInterface/product/productWidgets/description.dart';
import 'package:milk_app/ui/screens/mainAppInterface/product/productWidgets/productDetailsAndQty.dart';
import 'package:milk_app/ui/screens/mainAppInterface/product/productWidgets/productImages.dart';


class Product extends StatelessWidget {
  static Future data = Network.getOrders();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                ProductImages(),
                ProductDetailsAndQty(),
                _horizontalLine(context),
                Description(),
                _horizontalLine(context),
                Days(),
                _horizontalLine(context),
                Dates(),
                _horizontalLine(context),
                SizedBox(height: 20.0,),
                Center(child: Bill()),
                SizedBox(height: 20.0,),
                FutureBuilder(
                  future: data,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if(snapshot.hasData) {
                      return ConfirmButton();
                    }
                    else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget _horizontalLine(BuildContext context) {
    return Container(
      height: 3.0,
      width: MediaQuery.of(context).size.width - 35.0,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(2.0)
      ),
    );
  }
}
