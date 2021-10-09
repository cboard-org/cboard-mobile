// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

import 'package:cboard_mobile/data/jsonString.dart';

Map<String, Folder> defaultBoards = getData(jsonString).folders;

Data getData(String str) => Data.fromJson(json.decode(str));

String postToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.beginner,
    // this.advanced,
    this.folders,
  });

  List<dynamic> beginner;
  // List<Folder> advanced;
  Map<String, Folder> folders;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        beginner: json["beginner"] as List<dynamic>,
        // advanced:
        //     json["advanced"].map<Folder>((x) => Folder.fromJson(x)).toList(),
        folders: <String, Folder>{
          for (Folder value in json["advanced"]
              .map<Folder>((x) => Folder.fromJson(x))
              .toList())
            value.id: value
        },
      );

  Map<String, dynamic> toJson() => {
        "beginner": beginner,
        // "advanced": advanced.map((x) => x.toJson()).toList(),
      };
}

class Folder {
  Folder({
    this.id,
    this.name,
    this.nameKey,
    this.author,
    this.email,
    this.isPublic,
    this.hidden,
    this.subItems,
    this.caption,
  });

  String id;
  String name;
  String nameKey;
  Author author;
  Email email;
  bool isPublic;
  bool hidden;
  List<TileData> subItems;
  String caption;

  factory Folder.fromJson(Map<String, dynamic> json) => Folder(
        id: json["id"],
        name: json["name"],
        nameKey: json["nameKey"],
        author: authorValues.map[json["author"]],
        email: emailValues.map[json["email"]],
        isPublic: json["isPublic"],
        hidden: json["hidden"],
        subItems:
            json["tiles"].map<TileData>((x) => TileData.fromJson(x)).toList(),
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
        "tiles": subItems.map((x) => x.toJson()).toList(),
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
