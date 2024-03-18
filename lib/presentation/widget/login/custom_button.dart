import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.onpress,
  });

  final double width;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade600,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        width: width / 2.18,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Continue',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const CircleAvatar(
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
