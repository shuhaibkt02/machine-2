import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:machine_video/data/model/category_model.dart';
import 'package:machine_video/data/repo/post_repo.dart';

class PostProvider extends ChangeNotifier {
  List<CategoryModel> category = [];
  List<String> categoryList = ['Physics', 'Maths'];
  String videoPath = '';
  String thumnailPath = '';
  PostRepository postRepository = PostRepository();

  void init() async {
    category = await postRepository.fetchCategory();
  }

  Future<void> videoPicker() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.video);

    if (result != null) {
      File file = File(result.files.single.path!);
      videoPath = '$file';
      log('$file');
    } else {
      throw Exception('Empty video file');
    }
    notifyListeners();
  }

  Future<void> thumbnailPicker() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      File file = File(result.files.single.path!);
      // thumnailPath = '$file';
      log('$file');
    } else {
      throw Exception('Empty thumbnail');
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
