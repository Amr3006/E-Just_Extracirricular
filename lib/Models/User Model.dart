// ignore_for_file: camel_case_types, file_names, unnecessary_this, prefer_collection_literals

class UserModel {
  late String name;
  late String email;
  late String phone;
  late String uId;
  late String profilePicture;
  late bool isClub;
  late List<String> following;

  UserModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.uId,
      required this.profilePicture,
      required this.isClub,
      required this.following});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    profilePicture = json['profilePicture'];
    isClub = json['isClub'];
    following = json['following'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['uId'] = this.uId;
    data['profilePicture'] = this.profilePicture;
    data['isClub'] = this.isClub;
    data['following'] = this.following;
    return data;
  }

  UserModel clone() {
    return UserModel(
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        profilePicture: profilePicture,
        isClub: isClub,
        following: List.from(following));
  }
}
