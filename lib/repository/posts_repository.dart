import 'dart:convert';
import 'package:flutter_bloc_example/models/post_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc_example/models/posts.dart';

class PostsRepository {
  String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Posts>> loadPosts() async {
    final response = await http.get(Uri.parse(url));
    final decodedJson = jsonDecode(response.body) as List;
    final PostList postList = PostList.from(decodedJson);
    return postList.posts;
  }
}
