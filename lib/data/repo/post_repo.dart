import 'package:dio/dio.dart';
import 'package:machine_video/data/model/category_model.dart';
import 'package:machine_video/data/model/post_model.dart';

abstract class PostService {
  Future<List<CategoryModel>> fetchCategory();
  Future<List<PostModel>> fetchPosts();
  Future<void> addPost();
}


class PostRepository extends PostService{
  final Dio dio = Dio();
  String baseUri = 'https://frijo.noviindus.in/api';
  @override
  Future<void> addPost() {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryModel>> fetchCategory() {
    // TODO: implement fetchCategory
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> fetchPosts() {
    // TODO: implement fetchPosts
    throw UnimplementedError();
  }
} 