
class AddressModel {
  final List<Address> posts;

  AddressModel({this.posts});

  factory AddressModel.fromJson(List<dynamic> parsedJson) {     //List<Post> will also work
    List<Address> tempPosts;  //creating list of type post
    tempPosts = parsedJson.map((i) => Address.fromJson(i)).toList();  //.map() is a function for iteratig through list. i => contains post ie object  // we are just adding objects or a Post tothe list
    return new AddressModel(posts: tempPosts);
  }
}

class Address {
  String uid;
  String house;
  String locality;
  String city;
  String landmark;
  String pincode;

  Address(
      {this.uid,
        this.house,
        this.locality,
        this.city,
        this.landmark,
        this.pincode});

  Address.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    house = json['house'];
    locality = json['locality'];
    city = json['city'];
    landmark = json['landmark'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['house'] = this.house;
    data['locality'] = this.locality;
    data['city'] = this.city;
    data['landmark'] = this.landmark;
    data['pincode'] = this.pincode;
    return data;
  }
}
