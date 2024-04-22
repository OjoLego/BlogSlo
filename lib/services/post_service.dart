import 'dart:convert';

import 'package:blog_slo/models/post.dart';
import 'package:blog_slo/util/constants.dart';
import 'package:http/http.dart' as http;
Future<List<Post>> fetchPosts() async {
  final response = await http.get(Uri.parse(getPostsURL));

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}