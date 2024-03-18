import 'package:flutter/material.dart';

class LabelWrapper extends StatelessWidget {
  final String label;
  final Widget? child;
  const LabelWrapper({
    super.key,
    required this.label,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            label,
            style: textTheme.bodyMedium,
          ),
        ),
        child ?? const SizedBox(),
      ],
    );
  }
}
