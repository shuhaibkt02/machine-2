import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:machine_video/presentation/logic/auth_provider.dart';
import 'package:machine_video/presentation/screen/home_screen.dart';
import 'package:machine_video/presentation/widget/login/custom_button.dart';
import 'package:machine_video/presentation/widget/login/custom_text_field.dart';
import 'package:machine_video/presentation/widget/login/label_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    double width = MediaQuery.sizeOf(context).width;
    final prov = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder<bool>(
            stream: prov.isLogging,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              }

              return Column(
                children: [
                  SizedBox(
                    height: width / 8,
                  ),
                  LabelWidget(width: width, textTheme: textTheme),
                  CustomTextFormField(width: width, textTheme: textTheme),
                  SizedBox(
                    height: width / 2.3,
                  ),
                  CustomButton(
                    width: width,
                    onpress: () {
                      Provider.of<AuthProvider>(context).login(context);
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
