import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController mobileController = TextEditingController();

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }
}
