import 'package:flutter/material.dart';
import 'package:machine_video/presentation/logic/post_provider.dart';
import 'package:machine_video/presentation/widget/add%20post/label_wrapper.dart';
import 'package:machine_video/presentation/widget/add%20post/tag_list.dart';
import 'package:machine_video/presentation/widget/add%20post/video_upload.dart';
import 'package:machine_video/utils/constant.dart';
import 'package:provider/provider.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<PostProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Feeds', style: textTheme.bodySmall),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.red, width: 0.5),
              ),
              child: Text('Share post', style: textTheme.bodySmall),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                ),
                height: width / 1.8,
                width: double.infinity,
                child: OpenFileWidget(
                  textTheme: textTheme,
                  onTap: () {
                    prov.videoPicker();
                  },
                  video: true,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                    style: BorderStyle.solid,
                  ),
                ),
                height: width / 3.8,
                width: width,
                child: OpenFileWidget(
                  textTheme: textTheme,
                  onTap: () {
                    prov.thumbnailPicker();
                  },
                  video: false,
                ),
              ),
              const SizedBox(height: 10),
              LabelWrapper(
                label: 'Add Description',
                child: TextFormField(
                  style: textTheme.bodySmall,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              LabelWrapper(
                label: categroyTitle,
                child: TagList(textTheme: textTheme),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
