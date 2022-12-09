import 'dart:convert';

class Imagemodel {
  Imagemodel({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  final int? id;
  final String? pageUrl;
  final String? type;
  final String? tags;
  final String? previewUrl;
  final int? previewWidth;
  final int? previewHeight;
  final String? webformatUrl;
  final int? webformatWidth;
  final int? webformatHeight;
  final String? largeImageUrl;
  final int? imageWidth;
  final int? imageHeight;
  final int? imageSize;
  final int? views;
  final int? downloads;
  final int? collections;
  final int? likes;
  final int? comments;
  final int? userId;
  final String? user;
  final String? userImageUrl;

  factory Imagemodel.fromJson(Map<String, dynamic> json) => Imagemodel(
        id: json["id"] == null ? null : json["id"],
        pageUrl: json["pageURL"] == null ? null : json["pageURL"],
        type: json["type"] == null ? null : json["type"],
        tags: json["tags"] == null ? null : json["tags"],
        previewUrl: json["previewURL"] == null ? null : json["previewURL"],
        previewWidth:
            json["previewWidth"] == null ? null : json["previewWidth"],
        previewHeight:
            json["previewHeight"] == null ? null : json["previewHeight"],
        webformatUrl:
            json["webformatURL"] == null ? null : json["webformatURL"],
        webformatWidth:
            json["webformatWidth"] == null ? null : json["webformatWidth"],
        webformatHeight:
            json["webformatHeight"] == null ? null : json["webformatHeight"],
        largeImageUrl:
            json["largeImageURL"] == null ? null : json["largeImageURL"],
        imageWidth: json["imageWidth"] == null ? null : json["imageWidth"],
        imageHeight: json["imageHeight"] == null ? null : json["imageHeight"],
        imageSize: json["imageSize"] == null ? null : json["imageSize"],
        views: json["views"] == null ? null : json["views"],
        downloads: json["downloads"] == null ? null : json["downloads"],
        collections: json["collections"] == null ? null : json["collections"],
        likes: json["likes"] == null ? null : json["likes"],
        comments: json["comments"] == null ? null : json["comments"],
        userId: json["user_id"] == null ? null : json["user_id"],
        user: json["user"] == null ? null : json["user"],
        userImageUrl:
            json["userImageURL"] == null ? null : json["userImageURL"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "pageURL": pageUrl == null ? null : pageUrl,
        "type": type,
        "tags": tags == null ? null : tags,
        "previewURL": previewUrl == null ? null : previewUrl,
        "previewWidth": previewWidth == null ? null : previewWidth,
        "previewHeight": previewHeight == null ? null : previewHeight,
        "webformatURL": webformatUrl == null ? null : webformatUrl,
        "webformatWidth": webformatWidth == null ? null : webformatWidth,
        "webformatHeight": webformatHeight == null ? null : webformatHeight,
        "largeImageURL": largeImageUrl == null ? null : largeImageUrl,
        "imageWidth": imageWidth == null ? null : imageWidth,
        "imageHeight": imageHeight == null ? null : imageHeight,
        "imageSize": imageSize == null ? null : imageSize,
        "views": views == null ? null : views,
        "downloads": downloads == null ? null : downloads,
        "collections": collections == null ? null : collections,
        "likes": likes == null ? null : likes,
        "comments": comments == null ? null : comments,
        "user_id": userId == null ? null : userId,
        "user": user == null ? null : user,
        "userImageURL": userImageUrl == null ? null : userImageUrl,
      };
}
