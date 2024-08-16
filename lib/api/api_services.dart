import 'package:dio/dio.dart';
import 'package:socila_media_application/models/post_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Fetch list of posts
  Future<List<Post>> fetchPosts() async {
    try {
      final response = await _dio.get('$baseUrl/posts');
      List<Post> posts = (response.data as List).map((json) => Post.fromJson(json)).toList();
      return posts;
    } catch (e) {
      throw Exception('Failed to load posts');
    }
  }

  // Fetch details of a single post
  Future<Post> fetchPostDetails(int id) async {
    try {
      final response = await _dio.get('$baseUrl/posts/$id');
      return Post.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load post details');
    }
  }
}
