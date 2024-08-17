import 'package:dio/dio.dart';
import 'package:socila_media_application/exceptions/app_exceptions.dart';
import 'package:socila_media_application/models/CommentModel.dart';
import 'package:socila_media_application/models/UserModel.dart';
import 'package:socila_media_application/models/app_data.dart';
import 'package:socila_media_application/models/post_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<void> fetchPosts() async {
    try {
      final response = await _dio.get('$baseUrl/posts');
      List<Post> posts =
          (response.data as List).map((json) => Post.fromJson(json)).toList();

      AppData().updatePosts(posts);
    } on DioException catch (e) {
      throw AppExceptions.handleError(e);
    } catch (e) {
      throw Exception('Failed to load posts');
    }
  }

  Future<void> fetchComments() async {
    try {
      final response = await _dio.get('$baseUrl/comments');
      List<Comment> comments = (response.data as List)
          .map((json) => Comment.fromJson(json))
          .toList();
      AppData().updateComments(comments);
    } on DioException catch (e) {
      throw AppExceptions.handleError(e);
    } catch (e) {
      throw Exception('faile to load comments');
    }
  }

  Future<void> fetchUser() async {
    try {
      final response = await _dio.get('$baseUrl/users');
      List<User> users =
          (response.data as List).map((json) => User.fromJson(json)).toList();
      AppData().updateUsers(users);
    } on DioException catch (e) {
      throw AppExceptions.handleError(e);
    } catch (e) {
      throw Exception('failed to load users');
    }
  }

  // Fetch details of a single post
  Future<Post> fetchPostDetails(int id) async {
    try {
      final response = await _dio.get('$baseUrl/posts/$id');
      return Post.fromJson(response.data);
    } on DioException catch (e) {
      throw AppExceptions.handleError(e);
    } catch (e) {
      throw Exception('Failed to load post details');
    }
  }
}
