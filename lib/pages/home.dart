import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdata/blok/blokPost.dart';
import 'package:providerdata/pages/detialPost.dart';
import 'package:providerdata/widget/cardpost.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final BlokPost blokPost = Provider.of(context);
    blokPost.fecthpost();

    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: blokPost.listpost != null
          ? ListView.builder(
              itemCount: blokPost.listpost.length,
              itemBuilder: (BuildContext context, int i) {
                return GestureDetector(
                  onTap: () {
                    blokPost.getIdPost = blokPost.listpost[i].id;

                    print(blokPost.getIdPost);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPost(id: blokPost.listpost[i].id)));
                  },
                  child: cardPost(
                      blokPost.listpost[i].id, blokPost.listpost[i].title),
                );
              })
          : Center(child: CircularProgressIndicator()),
    );
  }
}
