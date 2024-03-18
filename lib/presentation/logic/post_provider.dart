import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  List<String> categoryList = ['Physics', 'Maths'];

  final StreamController<String> _videoPathController = StreamController<String>();
  Stream<String> get videoPathStream => _videoPathController.stream;

  final StreamController<String> _thumbnailPathController =
      StreamController<String>();
  Stream<String> get thumbnailPathStream => _thumbnailPathController.stream;

  Future<void> videoPicker() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.video);

    if (result != null) {
      File file = File(result.files.single.path!);
      _videoPathController.add(file.path);
      log('$file');
    } else {
      throw Exception('Empty video file');
    }
  }

  Future<void> thumbnailPicker() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      File file = File(result.files.single.path!);
      _thumbnailPathController.add(file.path);
      log('$file');
    } else {
      throw Exception('Empty thumbnail');
    }
  }

  @override
  void dispose() {
    _videoPathController.close();
    _thumbnailPathController.close();
    super.dispose();
  }
}
