import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/mainAppInterface/home/homeWidgets/productsListView.dart';
import 'package:milk_app/ui/screens/mainAppInterface/product/productWidgets/productDetailsAndQty.dart';

import 'dates.dart';

class Bill extends StatefulWidget {
  static bool isDispose = false;
  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  int totalAmount() {
    int qty = ProductDetailsAndQty.qty;
    int price = int.parse(ProductsListView.productPrice);
    int days = int.parse(Dates.noOfDays.inDays.toString());
    return qty * price * days;
  }
  Future data() async{
    Future.delayed(Duration(milliseconds: 10),() async {
      if(Bill.isDispose == false){
        setState(() {});
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Bill.isDispose = false;
    data();
    return Container(
      child: Text(
        "Total Amount : ₹${totalAmount()}.00",
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Bill.isDispose = true;
  }
}
