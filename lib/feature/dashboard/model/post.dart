// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);
import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<Post>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  String toJson() => json.encode(toMap());

  factory Post.fromJson(dynamic json) => Post(
    userId: json["userId"] ?? null,
    id: json["id"] ?? null,
    title: json["title"] ?? null,
    body: json["body"] ?? null,
  );

  Map<String, dynamic> toMap() => {
    "userId": userId == null ? null : userId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "body": body == null ? null : body,
  };
}