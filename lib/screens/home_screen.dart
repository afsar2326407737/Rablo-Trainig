import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socila_media_application/api/api_services.dart';
import 'package:socila_media_application/models/post_model.dart';
import 'package:socila_media_application/models/app_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch posts and update AppData singleton
    ApiService().fetchPosts().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Post> posts = AppData().getPosts();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Posts',
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: const Color.fromARGB(170, 0, 0, 0),
      ),
      body: posts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Post post = posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                  onTap: () {
                    Get.toNamed('/post', arguments: post.id);
                  },
                );
              },
            ),
    );
  }
}
