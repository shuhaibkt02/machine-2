import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_video/data/repo/auth_repo.dart';
import 'package:machine_video/data/repo/post_repo.dart';
import 'package:machine_video/presentation/logic/auth/auth_bloc.dart';
import 'package:machine_video/presentation/logic/post/post_bloc.dart';
import 'package:machine_video/presentation/screen/add_post.dart';
import 'package:machine_video/presentation/screen/home_screen.dart';
import 'package:machine_video/presentation/screen/login_screen.dart';
import 'package:machine_video/utils/constant.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authRepository: AuthRepository()),
        ),
        BlocProvider(
          create: (context) => PostBloc(postRepository: PostRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Video Feed',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const LoginScreen(),
      ),
    );
  }
}
