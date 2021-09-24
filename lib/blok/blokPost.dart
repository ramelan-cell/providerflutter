import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:providerdata/model/postModel.dart';
import 'package:http/http.dart' as http;

class BlokPost extends ChangeNotifier {
  List<Post> _post;
  List<Post> get listpost => _post;

  set listpost(List<Post> val) {
    _post = val;
    notifyListeners();
  }

  Post _detail;
  Post get detailPost => _detail;

  set detailPost(Post val) {
    _detail = val;
    notifyListeners();
  }

  int _id = 0;
  get getIdPost => _id;

  set getIdPost(int val) {
    if (val != 0) {
      _id = val;
    }
    notifyListeners();
  }

  Future<List<Post>> fecthpost() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    List res = jsonDecode(response.body);

    List<Post> data = [];

    for (var i = 0; i < res.length; i++) {
      var post = Post.fromJson(res[i]);
      data.add(post);
    }

    listpost = data;

    return listpost;
  }

  Future<Post> getDetail() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/' + _id.toString()));

    detailPost = Post.fromJson(jsonDecode(response.body));
    return detailPost;
  }
}
