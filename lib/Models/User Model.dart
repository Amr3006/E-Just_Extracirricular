// ignore_for_file: camel_case_types, file_names

class UserModel {
  late String name;
  late String email;
  late String phone;
  late String uId;
  late String profilePicture;
  late bool isClub;

  UserModel({required this.name, required this.email,required this.phone,required this.uId,required this.profilePicture, required this.isClub});

  UserModel.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
    email = json?['email'];
    phone = json?['phone'];
    uId = json?['uId'];
    profilePicture = json?['profilePicture'];
    isClub = json?['isClub'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['uId'] = uId;
    data['profilePicture'] = profilePicture;
    data['isClub'] = isClub;
    return data;
  }
}