part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();
}

class PostsInitial extends PostsState {
  @override
  List<Object> get props => [];
}

class LoadedState extends PostsState {
  final List<Posts> postList;
  const LoadedState(this.postList);
  @override
  // TODO: implement props
  List<Object?> get props => [postList];
}

class ErrorState extends PostsState {
  final String message;
  const ErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
