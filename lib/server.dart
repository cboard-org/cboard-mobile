import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyJson());

class MyJson extends StatefulWidget {
  @override
  _MyJson createState() => _MyJson();
}

class _MyJson extends State<MyJson> {
  Future<Post> post;

  @override
  void initState() {
    super.initState();
    // post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                    snapshot.data.data.elementAt(1).tiles.elementAt(1).image);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

// Future<Post> fetchPost() async {
//   final response = await http.get('https://api.app.qa.cboard.io/board/public');
//
//   if (response.statusCode == 200) {
//     var post = Post.fromJson(json.decode(response.body));
//     print(post);
//     return post;
//   } else {
//     throw Exception('Failed to load post');
//   }
// }

class Post {
  Post({
    this.total,
    this.page,
    this.limit,
    this.offset,
    this.sort,
    this.search,
    this.data,
  });

  int total;
  int page;
  int limit;
  int offset;
  String sort;
  String search;
  List<Datum> data;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
        offset: json["offset"],
        sort: json["sort"],
        search: json["search"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "limit": limit,
        "offset": offset,
        "sort": sort,
        "search": search,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.isPublic,
    this.tiles,
    this.cellSize,
    this.locale,
    this.format,
    this.description,
    this.isFixed,
    this.name,
    this.author,
    this.email,
    this.caption,
    this.lastEdited,
    this.id,
    this.grid,
  });

  bool isPublic;
  List<Tile> tiles;
  String cellSize;
  String locale;
  String format;
  String description;
  bool isFixed;
  String name;
  String author;
  String email;
  String caption;
  DateTime lastEdited;
  String id;
  Grid grid;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        isPublic: json["isPublic"],
        tiles: List<Tile>.from(json["tiles"].map((x) => Tile.fromJson(x))),
        cellSize: json["cellSize"],
        locale: json["locale"],
        format: json["format"],
        description: json["description"],
        isFixed: json["isFixed"],
        name: json["name"],
        author: json["author"],
        email: json["email"],
        caption: json["caption"],
        lastEdited: DateTime.parse(json["lastEdited"]),
        id: json["id"],
        grid: json["grid"] == null ? null : Grid.fromJson(json["grid"]),
      );

  Map<String, dynamic> toJson() => {
        "isPublic": isPublic,
        "tiles": List<dynamic>.from(tiles.map((x) => x.toJson())),
        "cellSize": cellSize,
        "locale": locale,
        "format": format,
        "description": description,
        "isFixed": isFixed,
        "name": name,
        "author": author,
        "email": email,
        "caption": caption,
        "lastEdited": lastEdited.toIso8601String(),
        "id": id,
        "grid": grid == null ? null : grid.toJson(),
      };
}

class Grid {
  Grid({
    this.rows,
    this.columns,
    this.order,
  });

  int rows;
  int columns;
  List<List<String>> order;

  factory Grid.fromJson(Map<String, dynamic> json) => Grid(
        rows: json["rows"],
        columns: json["columns"],
        order: List<List<String>>.from(json["order"]
            .map((x) => List<String>.from(x.map((x) => x == null ? null : x)))),
      );

  Map<String, dynamic> toJson() => {
        "rows": rows,
        "columns": columns,
        "order": List<dynamic>.from(order.map(
            (x) => List<dynamic>.from(x.map((x) => x == null ? null : x)))),
      };
}

class Tile {
  Tile({
    this.label,
    this.vocalization,
    this.image,
    this.loadBoard,
    this.sound,
    this.type,
    this.backgroundColor,
    this.linkedBoard,
    this.id,
    this.labelKey,
  });

  String label;
  String vocalization;
  String image;
  LoadBoard loadBoard;
  String sound;
  Type type;
  BackgroundColor backgroundColor;
  bool linkedBoard;
  String id;
  String labelKey;

  factory Tile.fromJson(Map<String, dynamic> json) => Tile(
        label: json["label"],
        vocalization: json["vocalization"],
        image: json["image"],
        loadBoard: loadBoardValues.map[json["loadBoard"]],
        sound: json["sound"],
        type: typeValues.map[json["type"]],
        backgroundColor: backgroundColorValues.map[json["backgroundColor"]],
        linkedBoard: json["linkedBoard"],
        id: json["id"],
        labelKey: json["labelKey"] == null ? null : json["labelKey"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "vocalization": vocalization,
        "image": image,
        "loadBoard": loadBoardValues.reverse[loadBoard],
        "sound": sound,
        "type": typeValues.reverse[type],
        "backgroundColor": backgroundColorValues.reverse[backgroundColor],
        "linkedBoard": linkedBoard,
        "id": id,
        "labelKey": labelKey == null ? null : labelKey,
      };
}

enum BackgroundColor {
  BBDEFB,
  FFF176,
  THE_4_CAF50,
  THE_2196_F3,
  CE93_D8,
  FFFFFF
}

final backgroundColorValues = EnumValues({
  "#bbdefb": BackgroundColor.BBDEFB,
  "#CE93D8": BackgroundColor.CE93_D8,
  "#fff176": BackgroundColor.FFF176,
  "#ffffff": BackgroundColor.FFFFFF,
  "#2196F3": BackgroundColor.THE_2196_F3,
  "#4CAF50": BackgroundColor.THE_4_CAF50
});

enum LoadBoard {
  THE_602_E54_A46_DA4_CD00127_E7859,
  EMPTY,
  THE_602_D15_A083821500191_B4621
}

final loadBoardValues = EnumValues({
  "": LoadBoard.EMPTY,
  "602d15a083821500191b4621": LoadBoard.THE_602_D15_A083821500191_B4621,
  "602e54a46da4cd00127e7859": LoadBoard.THE_602_E54_A46_DA4_CD00127_E7859
});

enum Type { FOLDER, BUTTON }

final typeValues = EnumValues({"button": Type.BUTTON, "folder": Type.FOLDER});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
