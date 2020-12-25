import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/util/checkUser.dart';
import 'package:milk_app/ui/screens/mainAppInterface/home/homeWidgets/productsListView.dart';
import 'package:milk_app/ui/screens/mainAppInterface/product/productWidgets/dates.dart';
import 'package:milk_app/ui/screens/mainAppInterface/product/productWidgets/days.dart';
import 'package:milk_app/ui/screens/mainAppInterface/product/productWidgets/productDetailsAndQty.dart';
import 'package:milk_app/ui/screens/mainAppInterface/product/util/daysValues.dart';
import 'package:intl/intl.dart';
import 'package:milk_app/util/addOrder.dart';

class ConfirmButton extends StatefulWidget {
  @override
  _ConfirmButtonState createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {

  int totalAmount() {
    int qty = ProductDetailsAndQty.qty;
    int price = int.parse(ProductsListView.productPrice);
    int days = int.parse(Dates.noOfDays.inDays.toString());
    return qty * price * days;
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      child: Card(
        margin: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 50.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
        ),
        elevation: 5.0,
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
                width: 2.0,
                color: Colors.grey
            ),
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
          child: Text(
            "Confirm",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      onTap: () {
        addOrder(
          uid: User.uid,
          productId: ProductsListView.productId,
          qty: ProductDetailsAndQty.qty,
          startDate: DateFormat("dd/MM/y").format(Dates.startDateTime),
          endDate: DateFormat("dd/MM/y").format(Dates.endDateTime),
          days: Days.daysSelected.toString(),
          daysValues: daysValues(),
          totalAmount: totalAmount()
        );
      },
    );
  }
}


