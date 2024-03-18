part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostLoaded extends PostState {
  final List<PostModel> postData;
  final List<CategoryModel> categoryData;

  PostLoaded({
    required this.postData,
    required this.categoryData,
  });
}

final class PostError extends PostState {
  final String errorMessage;

  PostError({required this.errorMessage});
}
