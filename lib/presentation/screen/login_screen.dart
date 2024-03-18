import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_video/presentation/logic/auth/auth_bloc.dart';
import 'package:machine_video/presentation/screen/add_post.dart';
import 'package:machine_video/presentation/screen/home_screen.dart';
import 'package:machine_video/presentation/widget/login/custom_button.dart';
import 'package:machine_video/presentation/widget/login/custom_text_field.dart';
import 'package:machine_video/presentation/widget/login/label_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    double width = MediaQuery.sizeOf(context).width;
    TextEditingController controller = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddPost(),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                SizedBox(
                  height: width / 8,
                ),
                LabelWidget(width: width, textTheme: textTheme),
                CustomTextFormField(
                    width: width, textTheme: textTheme, controller: controller),
                SizedBox(
                  height: width / 2.3,
                ),
                CustomButton(
                  width: width,
                  onpress: () {
                    // final phoneNumber = controller.text.trim();
                    // context.read<AuthBloc>().add(
                    //       Login(phoneNumber: phoneNumber),
                    //     );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
