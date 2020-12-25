import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/network/network.dart';
import 'file:///C:/Users/Jiten%20Patel/Desktop/Milkapp/milk_app/lib/ui/screens/mainAppInterface/product/product.dart';
import 'package:milk_app/util/data.dart';


class ProductsListView extends StatefulWidget {
  static String productId;
  static String productName;
  static String productPrice;
  static List productsList;
  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {

  static Future data;
  Future getProductsData() => Network.getProducts();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getProductsData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          ProductsListView.productsList = snapshot.data.posts;
          return Container(
            height: 432,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: ProductsListView.productsList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 2.0,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(Data.imagesList2[index]),
                            radius: 40.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.0,top: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${ProductsListView.productsList[index].productName}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0
                                  ),
                                ),
                                SizedBox(height: 5.0,),
                                Text(
                                  "₹${ProductsListView.productsList[index].price}.00",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0
                                  ),
                                ),
                              ],
                            )
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(
                                  Icons.control_point_duplicate
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                  onTap: () {
                    ProductsListView.productId = ProductsListView.productsList[index].productId;
                    ProductsListView.productName = ProductsListView.productsList[index].productName;
                    ProductsListView.productPrice = ProductsListView.productsList[index].price;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Product()
                        )
                    );
                  },
                );
              },
            ),
          );
        }
        else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
