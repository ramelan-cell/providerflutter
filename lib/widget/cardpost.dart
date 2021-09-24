import 'package:flutter/material.dart';

Widget cardPost(id, title) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(id.toString()),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(title),
          ))
        ],
      ),
    ),
  );
}
