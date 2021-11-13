import 'package:dio/dio.dart';

class NetworkHelper {
  Future<List<dynamic>> getPosts() async {
    Response response =
        await Dio().get("https://jsonplaceholder.typicode.com/posts");
    return response.data;
  }

  Future<List<dynamic>> getComments({int? postID}) async {
    Response response = await Dio().get(
        "https://jsonplaceholder.typicode.com/posts/${postID! + 1}/comments");
    return response.data;
  }
}
