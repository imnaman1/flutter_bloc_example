import 'package:equatable/equatable.dart';

class Posts extends Equatable {
  final String id;
  final String userId;
  final String title;
  final String body;

  const Posts(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
        id: json['id'].toString(),
        userId: json['userId'].toString(),
        title: json['title'].toString(),
        body: json['body'].toString());
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, userId, title, body];
}
