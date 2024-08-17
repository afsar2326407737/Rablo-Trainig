import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socila_media_application/screens/home_screen.dart';
import 'package:socila_media_application/screens/post_details.dart';
import 'package:socila_media_application/screens/user_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Social Media App",
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(
          name: '/post',
          page: () => PostDetailsScreen(postId: Get.arguments as int),
        ),
        GetPage(name: '/userProfile', page: () => UserProfileScreen(userId: Get.arguments as int)),
      ],
    );
  }
}
