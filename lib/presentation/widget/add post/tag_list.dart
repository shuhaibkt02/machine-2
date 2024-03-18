import 'package:flutter/material.dart';
import 'package:machine_video/presentation/logic/post_provider.dart';
import 'package:machine_video/utils/constant.dart';
import 'package:provider/provider.dart';

class TagList extends StatelessWidget {
  final TextTheme textTheme;
  const TagList({
    super.key,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<PostProvider>(context);
    final categoryList = prov.category;

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
              categoryList[index].title,
              style: textTheme.bodySmall?.copyWith(color: Colors.grey.shade400),
            ),
          ),
        ),
      ),
    );
  }
}
