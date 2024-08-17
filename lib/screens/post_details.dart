import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socila_media_application/models/CommentModel.dart';
import 'package:socila_media_application/models/post_model.dart';
import 'package:socila_media_application/models/app_data.dart';

class PostDetailsScreen extends StatelessWidget {
  final int postId;

  const PostDetailsScreen({required this.postId});

  @override
  Widget build(BuildContext context) {
    Post post = AppData().getPosts().firstWhere((p) => p.id == postId);
    List<Comment> comments = AppData().getComments().where((c) => c.postId == postId).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Post Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(post.body, style: TextStyle(fontSize: 16)),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/userProfile', arguments: post.userId);
              },
              child: Text('View Author Profile'),
            ),
            SizedBox(height: 24),
            Text('Comments:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  Comment comment = comments[index];
                  return ListTile(
                    title: Text(comment.name),
                    subtitle: Text(comment.body),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
