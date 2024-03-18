import 'package:flutter/material.dart';

@immutable
class CategoryModel {
  final int id;
  final String title;

  const CategoryModel({
    required this.id,
    required this.title,
  });
  // final String image;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"]?? 0,
        title: json["title"]?? '',
      );
}
