import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_video/data/model/category_model.dart';
import 'package:machine_video/data/model/post_model.dart';
import 'package:machine_video/data/repo/post_repo.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;
  PostBloc({required this.postRepository}) : super(PostInitial()) {
    on<FetchDatas>((event, emit) async {
      try {
        emit(PostLoading());
        final posts = await postRepository.fetchPosts();
        final categories = await postRepository.fetchCategory();

        log('$posts');

        emit(PostLoaded(postData: posts, categoryData: categories));
      } catch (e) {
        emit(PostError(errorMessage: '$e'));
      }
    });
  }
}
