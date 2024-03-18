import 'package:flutter/material.dart';
import 'package:machine_video/utils/constant.dart';

class TagList extends StatelessWidget {
  final TextTheme textTheme;
  const TagList({
    super.key,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    List<String> categoryList = ['Physics', 'Maths'];

    return Wrap(
      children: List.generate(
        categoryList.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4),
          child: Chip(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: redBorder, width: 0.5),
              borderRadius: BorderRadius.circular(14),
            ),
            label: Text(
              categoryList[index],
              style: textTheme.bodySmall?.copyWith(color: Colors.grey.shade400),
            ),
          ),
        ),
      ),
    );
  }
}
