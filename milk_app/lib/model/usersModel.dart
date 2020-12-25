
class UsersModel {
  final List<User> posts;

  UsersModel({this.posts});

  factory UsersModel.fromJson(List<dynamic> parsedJson) {     //List<Post> will also work
    List<User> tempPosts;  //creating list of type post
    tempPosts = parsedJson.map((i) => User.fromJson(i)).toList();  //.map() is a function for iteratig through list. i => contains post ie object  // we are just adding objects or a Post tothe list
    return new UsersModel(posts: tempPosts);
  }
}

class User {
  String uid;
  String firstName;
  String lastName;
  String email;
  String phone;
  String userPassword;

  User(
      {this.uid,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.userPassword});

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    userPassword = json['user_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mail'] = this.email;
    data['phone'] = this.phone;
    data['user_password'] = this.userPassword;
    return data;
  }
}
