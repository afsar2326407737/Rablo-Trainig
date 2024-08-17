import 'package:socila_media_application/models/CommentModel.dart';
import 'package:socila_media_application/models/UserModel.dart';
import 'package:socila_media_application/models/post_model.dart';

class AppData {
  // Private constructor
  AppData._();

  // Singleton instance
  static final AppData _instance = AppData._();

  // Factory constructor
  factory AppData() {
    return _instance;
  }

  // Data fields
  List<Post> posts = [];
  List<Comment> comments = [];
  List<User> users = [];

  // Methods to update and fetch data
  void updatePosts(List<Post> newPosts) {
    posts = newPosts;
  }

  void updateComments(List<Comment> newComments) {
    comments = newComments;
  }

  void updateUsers(List<User> newUsers) {
    users = newUsers;
  }

  List<Post> getPosts() => posts;
  List<Comment> getComments() => comments;
  List<User> getUsers() => users;
}
