import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: width / 8,
          ),
          Container(
            height: width / 2,
            color: Colors.grey,
          ),
          SizedBox(
            height: width / 5,
          ),
          Container(
            height: width / 4,
            // color: Colors.grey,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    width: 60,
                    height: 55,
                    child: const Center(child: Text('+91')),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      width: width / 4,
                      height: 60,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Enter Mobile Number',
                          hintStyle: textTheme.bodySmall,
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              width: 0.5,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
