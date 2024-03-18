import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:machine_video/data/model/category_model.dart';
import 'package:machine_video/data/model/post_model.dart';
import 'package:machine_video/data/repo/auth_repo.dart';

abstract class PostService {
  Future<List<CategoryModel>> fetchCategory();
  Future<List<PostModel>> fetchPosts();
  Future<void> addPost({required PostModel postData});
}

class PostRepository extends PostService {
  final Dio dio = Dio();
  String baseUri = 'https://frijo.noviindus.in/api';
  @override
  Future<void> addPost({required PostModel postData}) async {
    try {
      FormData formData = FormData.fromMap({
        'id': postData.id,
        'desciption': postData.description,
        'image': postData.image,
        'video': postData.video,
        'follow': postData.follow,
        'created_at': postData.createdAt,
        // 'likes'[0]: 0,
        // 'likes'[1]: 0,
      });

      await dio.post('$baseUri/my_feed', data: formData);
    } catch (e) {
      throw Exception('Error fetching :$e');
    }
  }

  @override
  Future<List<CategoryModel>> fetchCategory() async {
    try {
      final token = await AuthRepository().loadToken();
      var headers = {'Authorization': 'Bearer $token'};

      final response = await dio.get('$baseUri/category_list',
          options: Options(headers: headers));

      log('$token');

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        if (responseData.containsKey('categories')) {
          final categroyJsonList = responseData['categories'] as List<dynamic>;

          final categroyData = categroyJsonList
              .map((category) => CategoryModel.fromJson(category))
              .toList();
          return categroyData;
        } else {
          throw Exception('Error: Response does not contain a "category" key.');
        }
      } else {
        throw Exception('Error: Unexpected status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('error :$e');
    }
  }

  @override
  Future<List<PostModel>> fetchPosts() async {
    try {
      final token = await AuthRepository().loadToken();
      var headers = {'Authorization': 'Bearer $token'};

      final response =
          await dio.get('$baseUri/home', options: Options(headers: headers));

      final responseData = response.data as Map<String, dynamic>;
      if (responseData.containsKey('results')) {
        final postJsonList = responseData['results'] as List<dynamic>;

        final postData = postJsonList
            .map((post) => PostModel.fromJson(post))
            .toList();
        return postData;
      } else {
        throw Exception('Error: Response does not contain a "category" key.');
      }
    } catch (e) {
      throw Exception('Error fetching :$e');
    }
  }
}
