import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_video/data/model/category_model.dart';
import 'package:machine_video/presentation/logic/post/post_bloc.dart';
import 'package:machine_video/presentation/widget/home/post_card.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostInitial) {
              print('state init');

              context.read<PostBloc>().add(FetchDatas());
            }
            if (state is PostLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is PostLoaded) {
              final post = state.postData;
              print('state loaded');
              return Column(
                children: [
                  _Category(
                    width: width,
                    textTheme: textTheme,
                    categories: post.first.categories,
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(
                    post.length,
                    (index) => PostCard(
                      width: width,
                      textTheme: textTheme,
                      post: post[index],
                    ),
                  )
                ],
              );
            }
            return Column(
              children: [
                _Category(
                  width: width,
                  textTheme: textTheme,
                  categories: [],
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          backgroundColor: Colors.redAccent.shade700,
          onPressed: () {
            context.read<PostBloc>().add(FetchDatas());
            print('clo');
          },
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
    required this.categories,
  });

  final double width;
  final TextTheme textTheme;
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width / 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Chip(
              labelStyle:
                  textTheme.bodySmall?.copyWith(color: Colors.grey.shade400),
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
                itemCount: categories.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Chip(
                    labelStyle: textTheme.bodySmall
                        ?.copyWith(color: Colors.grey.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    label: Text(categories[index].title),
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
