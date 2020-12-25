import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/mainAppInterface/home/homeWidgets/productsListView.dart';
import 'package:milk_app/util/data.dart';

class Description extends StatefulWidget {
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 17.5, vertical: 10.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          toggle == true ?
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              Data.description[int.parse(ProductsListView.productId) - 1],
            ),
          )
              :
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              Data.description2[int.parse(ProductsListView.productId) - 1],
            ),
          ),
          toggleButton()
        ],
      ),
    );
  }

  Widget toggleButton(){
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Text(
          toggle == false ? "More..." : "Less ⤒",
          textAlign: TextAlign.right,
        ),
      ),
      onTap: (){
        setState(() {
          toggle == true ? toggle = false : toggle = true;
        });
      },
    );
  }
}
