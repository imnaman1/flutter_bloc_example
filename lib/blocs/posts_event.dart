part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();
}

class FetchUsers extends PostsEvent {
  const FetchUsers();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
