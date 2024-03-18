import 'package:flutter/material.dart';
import 'package:machine_video/presentation/logic/post_provider.dart';
import 'package:machine_video/presentation/widget/home/post_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => PostProvider(),
      child: const HomeScreenWrapper(),
    );
  }
}

class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({super.key});
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<PostProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello name', style: textTheme.bodyMedium),
            const SizedBox(height: 8),
            Text('Welcome back to Section', style: textTheme.bodySmall),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/pic.png'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Category(width: width, textTheme: textTheme),
            const SizedBox(height: 10),
            PostCard(width: width, textTheme: textTheme),
          ],
        ),
      ),
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          backgroundColor: Colors.redAccent.shade700,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            size: 24,
          ),
        ),
      ),
    );
  }
}

class _Category extends StatelessWidget {
  const _Category({
    required this.width,
    required this.textTheme,
  });

  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width / 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Chip(
              labelStyle: textTheme.bodySmall
                  ?.copyWith(color: Colors.grey.shade400),
              label: const Row(
                children: [
                  Icon(
                    Icons.explore,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text('Explore'),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const VerticalDivider(),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 13,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Chip(
                    labelStyle: textTheme.bodySmall
                        ?.copyWith(color: Colors.grey.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    label: const Text('label'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
