import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdata/blok/blokPost.dart';
import 'package:providerdata/model/postModel.dart';

class DetailPost extends StatelessWidget {
  final int id;
  DetailPost({this.id});

  @override
  Widget build(BuildContext context) {
    final BlokPost blokPost = Provider.of<BlokPost>(context);
    blokPost.getDetail();
    Post post = blokPost.detailPost;

    print(post.title);

    return Scaffold(
      appBar: AppBar(
        title: Text(post.title ?? ''),
      ),
      body: post.id != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Text(post.id.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(post.title ?? ''),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(post.body ?? ''),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          blokPost.getIdPost = post.id - 1;
                        },
                        child: Text('PREV'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          blokPost.getIdPost = post.id + 1;
                        },
                        child: Text('NEXT'),
                      )
                    ],
                  ),
                )
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
