import 'package:flutter/material.dart';

void changeTilePic(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
            height: MediaQuery.of(context).size.height * .27,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: ListTile(
                      title: Text(
                        "Take photo",
                        style: TextStyle(fontSize: 16),
                      ),
                      leading: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black54,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      title: Text(
                        "Browse album",
                        style: TextStyle(fontSize: 16),
                      ),
                      leading: Icon(
                        Icons.image_search_outlined,
                        color: Colors.black54,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      title: Text(
                        "Search community",
                        style: TextStyle(fontSize: 16),
                      ),
                      leading: Icon(
                        Icons.search_outlined,
                        color: Colors.black54,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ));
      });
}
