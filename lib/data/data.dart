// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Data getData(String str) => Data.fromJson(json.decode(str));

String postToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.beginner,
    this.advanced,
    this.folder,
  });

  List<dynamic> beginner;
  List<Advanced> advanced;
  Map<String, Advanced> folder;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        beginner: json["beginner"] as List<dynamic>,
        advanced: json["advanced"].map((x) => Advanced.fromJson(x)).toList(),
        folder: <String, Advanced>{
          for (var value in (json["advanced"] as List<Map<String, dynamic>>))
            value["id"]: Advanced.fromJson(value)
        },
      );

  Map<String, dynamic> toJson() => {
        "beginner": beginner,
        "advanced": advanced.map((x) => x.toJson()).toList(),
      };
}

class Advanced {
  Advanced({
    this.id,
    this.name,
    this.nameKey,
    this.author,
    this.email,
    this.isPublic,
    this.hidden,
    this.tiles,
    this.caption,
  });

  String id;
  String name;
  String nameKey;
  Author author;
  Email email;
  bool isPublic;
  bool hidden;
  List<TileData> tiles;
  String caption;

  factory Advanced.fromJson(Map<String, dynamic> json) => Advanced(
        id: json["id"],
        name: json["name"],
        nameKey: json["nameKey"],
        author: authorValues.map[json["author"]],
        email: emailValues.map[json["email"]],
        isPublic: json["isPublic"],
        hidden: json["hidden"],
        tiles: json["tiles"].map((x) => TileData.fromJson(x)).toList(),
        caption: json["caption"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name == null ? null : name,
        "nameKey": nameKey,
        "author": authorValues.reverse[author],
        "email": emailValues.reverse[email],
        "isPublic": isPublic,
        "hidden": hidden,
        "tiles": tiles.map((x) => x.toJson()).toList(),
        "caption": caption,
      };
}

enum Author { CBOARD }

final authorValues = EnumValues({"Cboard": Author.CBOARD});

enum Email { SUPPORT_CBOARD_IO }

final emailValues = EnumValues({"support@cboard.io": Email.SUPPORT_CBOARD_IO});

class TileData {
  TileData({
    this.labelKey,
    this.image,
    this.id,
    this.backgroundColor,
    this.loadBoard,
  });

  String labelKey;
  String image;
  String id;
  BackgroundColor backgroundColor;
  String loadBoard;

  factory TileData.fromJson(Map<String, dynamic> json) => TileData(
        labelKey: json["labelKey"],
        image: json["image"],
        id: json["id"],
        backgroundColor: backgroundColorValues.map[json["backgroundColor"]],
        loadBoard: json["loadBoard"],
      );

  Map<String, dynamic> toJson() => {
        "labelKey": labelKey,
        "image": image,
        "id": id,
        "backgroundColor": backgroundColorValues.reverse[backgroundColor],
        "loadBoard": loadBoard,
      };
}

enum BackgroundColor { RGB_255241118, RGB_187222251 }

final backgroundColorValues = EnumValues({
  "rgb(187, 222, 251)": BackgroundColor.RGB_187222251,
  "rgb(255, 241, 118)": BackgroundColor.RGB_255241118
});

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
