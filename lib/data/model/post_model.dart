import 'package:flutter/material.dart';
import 'package:machine_video/data/model/category_model.dart';

@immutable
class PostModel {
  final int id;
  final String description;
  final List<CategoryModel> categories;
  final String image;
  final String video;
  final int likes;
  final int disLike;
  final String createdAt;
  final bool follow;

  const PostModel(
      {required this.id,
      required this.description,
      required this.image,
      required this.video,
      required this.likes,
      required this.disLike,
      required this.createdAt,
      required this.categories,
      required this.follow});

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"] ?? 0,
        description: json["description"] ?? '',
        image: json["image"] ?? '',
        video: json["video"] ?? '',
        likes: json["likes"][0] ?? '',
        disLike: json["likes"][1] ?? '',
        createdAt: json["created_at"] ?? '',
        follow: json["follow"] ?? false,
        categories: (json['category_dict'] as List)
            .map((category) => CategoryModel.fromJson(category))
            .toList(),
      );
}
