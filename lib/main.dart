import 'package:flutter/material.dart';
import 'package:machine_video/presentation/logic/auth_provider.dart';
import 'package:machine_video/presentation/logic/post_provider.dart';
import 'package:machine_video/presentation/logic/video_provider.dart';
// import 'package:machine_video/presentation/screen/add_post.dart';
import 'package:machine_video/presentation/screen/home_screen.dart';
import 'package:machine_video/presentation/screen/login_screen.dart';
import 'package:machine_video/utils/constant.dart';
import 'package:provider/provider.dart';
// import 'package:machine_video/presentation/screen/login_screen.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => AuthProvider()),
        Provider(create: (context) => PostProvider()),
        Provider(create: (context) => VideoProvider()),
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
