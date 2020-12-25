class UserProfilesModel {
  final List<UserProfile> posts;

  UserProfilesModel({this.posts});

  factory UserProfilesModel.fromJson(List<dynamic> parsedJson) {     //List<Post> will also work
    List<UserProfile> tempPosts;  //creating list of type post
    tempPosts = parsedJson.map((i) => UserProfile.fromJson(i)).toList();  //.map() is a function for iteratig through list. i => contains post ie object  // we are just adding objects or a Post tothe list
    return new UserProfilesModel(posts: tempPosts);
  }
}

class UserProfile {
  String profileId;
  String uid;
  String profile;

  UserProfile(
      {this.profileId,
        this.uid,
        this.profile,
      });

  UserProfile.fromJson(Map<String, dynamic> json) {
    profileId = json['profileId'];
    uid = json['uid'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profileId'] = this.profileId;
    data['uid'] = this.uid;
    data['profile'] = this.profile;
    return data;
  }
}