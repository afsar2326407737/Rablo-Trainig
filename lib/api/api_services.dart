import 'package:dio/dio.dart';
import 'package:socila_media_application/exceptions/app_exceptions.dart';
import 'package:socila_media_application/models/CommentModel.dart';
import 'package:socila_media_application/models/PostMdodel.dart';
import 'package:socila_media_application/models/UserModel.dart';

class ApiServices {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
    headers: {
      'Content-Type': 'application/json',
    },
  )
  );

  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await _dio.get('/post');
      return (response.data as List)
          .map((post) => PostModel.fromJson(post))
          .toList();
    } on DioException catch (e) {
      throw AppExceptions.handleError(e);
    }
  }

  // fetch commends for a specific post

  Future<List<CommentModel>> fetchComments(int postId) async {
    try {
      final response = await _dio.get('/post/$postId/comments');
      return (response.data as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList();
    } on DioException catch (e) {
      throw AppExceptions.handleError(e);
    }
  }

  // fetch the user details for a specific user

  Future<UserModel> fetchUser(int userId) async {
    try {
      final response = await _dio.get('/user/$userId');
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw AppExceptions.handleError(e);
    }
  }

  // create the new post
  Future<PostModel> createPost(PostModel newPost) async {
    try {
      final response = await _dio.post('/post', data: newPost.toJson());
      return PostModel.fromJson(response.data);
    } on DioException catch (e) {
      throw AppExceptions.handleError(e);
    }
  }  
}
