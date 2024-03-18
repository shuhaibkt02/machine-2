import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_video/data/repo/auth_repo.dart';
import 'package:machine_video/presentation/logic/auth/auth_bloc.dart';
import 'package:machine_video/presentation/screen/login_screen.dart';
import 'package:machine_video/utils/constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authRepository: AuthRepository()),
      child: MaterialApp(
        title: 'Video Feed',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const LoginScreen(),
      ),
    );
  }
}
