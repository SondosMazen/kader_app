import 'package:kader_app/api/api_settings.dart';

class Result {
  String id;
  String postDate;
  String guid;
  String postTitle;
  String postContent;
  String imageUrl;

  Result(
      {this.id,
        this.postDate,
        this.guid,
        this.postTitle,
        this.postContent,
        this.imageUrl});

  Result.fromJson(Map<String, dynamic> json) {
    print(json.toString());
    id = json['id'];
    postDate = json['post_date'];
    guid = json['guid'];
    // .replaceAll(new RegExp("\""),"'")
    postTitle = json['post_title'];
    postContent = json['post_content'];
    if(json['image_url'] == null){
      imageUrl = ApiSettings.DEFAULT_IMG;
    }
    else {
      if(json['image_url'].contains(".pdf")) {
        imageUrl = ApiSettings.DEFAULT_IMG;
      }
      else{
        imageUrl = json['image_url'].replaceAll(RegExp('http'), 'https');
      }
    }
  }

  static List<Result> parseList(List<dynamic> list) {
    return list.map((i) => Result.fromJson(i)).toList();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['post_date'] = this.postDate;
    data['guid'] = this.guid;
    data['post_title'] = this.postTitle;
    data['post_content'] = this.postContent;
    data['image_url'] = this.imageUrl;
    return data;
  }
}