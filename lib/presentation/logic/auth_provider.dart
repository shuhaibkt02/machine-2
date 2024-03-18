import 'dart:async';

import 'package:flutter/material.dart';
import 'package:machine_video/data/repo/auth_repo.dart';
import 'package:machine_video/presentation/screen/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  final StreamController<bool> _isLogging = StreamController<bool>();
  Stream<bool> get isLogging => _isLogging.stream;

  TextEditingController mobileController = TextEditingController();

  AuthRepository repository = AuthRepository();

  // void login(BuildContext context) async {
  //   final phone = mobileController.text.trim();
  //   await repository.loginUser(phone: phone);
  //   _isLogging.add(true);

    
  //     await Future.delayed(
  //       const Duration(seconds: 1),
  //       () {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const HomeScreen(),
  //           ),
  //         );
  //       },
  //     );
  //   }
  // }

  // @override
  // void dispose() {
  //   isLogging = false;
  //   mobileController.dispose();
  //   super.dispose();
  // }
}
