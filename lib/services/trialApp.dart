import 'package:flutter/material.dart';

import 'httpServices.dart';

class TrialApp extends StatelessWidget {
  const TrialApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HttpService httpService = HttpService();
    return Scaffold(
      appBar: AppBar(
        title: Text("Try http"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            // List<Post> posts = snapshot.data;
            // return ListView(
            //   children: posts
            //       .map(
            //         (Post post) => ListTile(
            //           title: Text(post.title),
            //           subtitle: Text("${post.userId}"),
            //         ),
            //       )
            //       .toList(),
            // );
            return Text(snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
