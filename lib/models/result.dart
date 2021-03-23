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
    id = json['id'];
    postDate = json['post_date'];
    guid = json['guid'];
    postTitle = json['post_title'];
    postContent = json['post_content'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post_date'] = this.postDate;
    data['guid'] = this.guid;
    data['post_title'] = this.postTitle;
    data['post_content'] = this.postContent;
    data['image_url'] = this.imageUrl;
    return data;
  }
}