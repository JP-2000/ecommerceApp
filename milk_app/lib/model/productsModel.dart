class ProductsModel {
  final List<Product> posts;

  ProductsModel({this.posts});

  factory ProductsModel.fromJson(List<dynamic> parsedJson) {     //List<Post> will also work
    List<Product> tempPosts;  //creating list of type post
    tempPosts = parsedJson.map((i) => Product.fromJson(i)).toList();  //.map() is a function for iteratig through list. i => contains post ie object  // we are just adding objects or a Post tothe list
    return new ProductsModel(posts: tempPosts);
  }
}

class Product {
  String productId;
  String productName;
  String price;

  Product({this.productId, this.productName, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    return data;
  }
}