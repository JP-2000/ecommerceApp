class OrdersModel {
  final List<Orders> posts;

  OrdersModel({this.posts});

  factory OrdersModel.fromJson(List<dynamic> parsedJson) {     //List<Post> will also work
    List<Orders> tempPosts;  //creating list of type post
    tempPosts = parsedJson.map((i) => Orders.fromJson(i)).toList();  //.map() is a function for iteratig through list. i => contains post ie object  // we are just adding objects or a Post tothe list
    return new OrdersModel(posts: tempPosts);
  }
}

class Orders {
  String orderId;
  String uid;
  String productId;
  String qty;
  String startDate;
  String endDate;
  String days;
  String daysValues;
  String totalAmount;

  Orders(
      {this.orderId,
        this.uid,
        this.productId,
        this.qty,
        this.startDate,
        this.endDate,
        this.days,
        this.daysValues,
        this.totalAmount
      });

  Orders.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    uid = json['uid'];
    productId = json['product_id'];
    qty = json['qty'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    days = json['days'];
    daysValues = json['days_values'];
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['uid'] = this.uid;
    data['product_id'] = this.productId;
    data['qty'] = this.qty;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['days'] = this.days;
    data['days_values'] = this.daysValues;
    data['total_amount'] = this.totalAmount;
    return data;
  }
}