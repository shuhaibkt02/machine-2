import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:machine_video/data/repo/auth_repo.dart';
import 'package:machine_video/presentation/screen/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  final StreamController<bool> _isLogging = StreamController<bool>();
  Stream<bool> get isLogging => _isLogging.stream;

  TextEditingController mobileController = TextEditingController();

  AuthRepository repository = AuthRepository();

  void login(BuildContext context) async {
    final phone = mobileController.text.trim();
    await repository.loginUser(phone: phone);
    log('message');
    _isLogging.add(true);
  }

  @override
  void dispose() {
    _isLogging.close();
    mobileController.dispose();
    super.dispose();
  }
}
