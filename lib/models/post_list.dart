import 'package:flutter_bloc_example/models/posts.dart';

class PostList {
  final List<Posts> posts;

  PostList({required this.posts});

  factory PostList.from(List<dynamic> parsedJson) {
    List<Posts> post = <Posts>[];
    post = parsedJson
        .map((i) => Posts.fromJson(i as Map<String, dynamic>))
        .toList();

    return PostList(posts: post);
  }
}
