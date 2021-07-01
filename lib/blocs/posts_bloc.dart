import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/models/posts.dart';
import 'package:flutter_bloc_example/repository/posts_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  List<Posts> posts = [];
  PostsRepository postsRepository = PostsRepository();
  PostsBloc() : super(PostsInitial());
  @override
  Stream<PostsState> mapEventToState(
    PostsEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is FetchUsers) {
      try {
        final List<Posts> post = await postsRepository.loadPosts();
        if (post.isEmpty) {
          yield const ErrorState('Error getting posts');
        } else {
          posts.addAll(post);
          yield LoadedState(posts);
        }
      } catch (e) {
        yield const ErrorState('Error getting posts');
      }
    }
  }
}
