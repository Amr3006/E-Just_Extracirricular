// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class PostModel {
  String? postImage;
  late String postText;
  late String posterName;
  late String posterProfilePicture;
  late String posteruId;
  late String postDate;
  dynamic eventDate;

  PostModel(
      {required this.postImage,
      required this.postText,
      required this.posterName,
      required this.posterProfilePicture,
      required this.posteruId,
      required this.postDate,
      required this.eventDate});

  PostModel.fromJson(Map<String, dynamic> json) {
    postImage = json['postImage'];
    postText = json['postText'];
    postDate = json['date'];
    posterName = json['posterName'];
    posterProfilePicture = json['posterProfilePicture'];
    posteruId = json['posteruId'];
    eventDate = json['eventDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postImage'] = this.postImage;
    data['postText'] = this.postText;
    data['posterName'] = this.posterName;
    data['date'] = this.postDate;
    data['posterProfilePicture'] = this.posterProfilePicture;
    data['posteruId'] = this.posteruId;
    data['eventDate'] = this.eventDate;
    return data;
  }
}
