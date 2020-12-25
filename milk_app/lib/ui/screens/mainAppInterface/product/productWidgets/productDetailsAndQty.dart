import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/mainAppInterface/home/homeWidgets/productsListView.dart';

class ProductDetailsAndQty extends StatefulWidget {
  static int qty = 0;
  @override
  _ProductDetailsAndQtyState createState() => _ProductDetailsAndQtyState();
}

class _ProductDetailsAndQtyState extends State<ProductDetailsAndQty> {
  @override
  Widget build(BuildContext context) {
    String productName = ProductsListView.productName;
    String productPrice = ProductsListView.productPrice;
    return WillPopScope(
      onWillPop: () async {
        ProductDetailsAndQty.qty = 0;
        return true;
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  productName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                ),
                SizedBox(height: 5.0,),
                Text("₹$productPrice")
              ],
            ),
            (ProductDetailsAndQty.qty <= 0) ? _qtyButtons2(): _qtyButtons(),
          ],
        ),
      ),
    );
  }

  Widget _qtyButtons2() {
    return Container(
      width: 102.0,
      height: 35.0,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 2.0,),
          Text(
            "ADD",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),
          plusButton(),
        ],
      ),
    );
  }

  Widget _qtyButtons() {
    return Container(
      width: 102.0,
      height: 35.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          minusButton(),
          Text(
            "${ProductDetailsAndQty.qty}",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),
          ),
          plusButton(),
        ],
      ),
    );
  }

  Widget minusButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
          alignment: Alignment.center,
          width: 34,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.black.withOpacity(0.3)
          ),
          child: Text(
            "-",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600
            ),
          )
      ),
      onTap: (){
        setState(() {
          if(ProductDetailsAndQty.qty > 0){
            ProductDetailsAndQty.qty--;
          }
        });
      },
    );
  }

  Widget plusButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        alignment: Alignment.center,
        width: 34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.black.withOpacity(0.3)
        ),
        child: Text(
          "+",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w600
          ),
        )
      ),
      onTap: (){
        setState(() {
          ProductDetailsAndQty.qty++;
        });
      },
    );
  }

}
