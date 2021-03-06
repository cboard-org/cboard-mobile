// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';
import 'dart:ui';

import 'package:cboard_mobile/models/data/jsonString.dart';

//Default home board that users first see when log in
Map<String, FolderModel> defaultBoards = getData(jsonString).folders;

//Transfer json data to dart objects
Data getData(String str) => Data.fromJson(json.decode(str));

//Transfer dart objects to json string for uploading to database
String postToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.beginner,
    // this.advanced,
    this.folders,
  });

  List<dynamic> beginner;

  // List<Folder> advanced;
  Map<String, FolderModel> folders;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        beginner: json["beginner"] as List<dynamic>,
        // advanced:
        //     json["advanced"].map<Folder>((x) => Folder.fromJson(x)).toList(),

        //Create folder obkect, map folder to its own id
        folders: <String, FolderModel>{
          for (FolderModel value in json["advanced"]
              .map<FolderModel>((x) => FolderModel.fromJson(x))
              .toList())
            value.id: value
        },
      );

  Map<String, dynamic> toJson() => {
        "beginner": beginner,
        // "advanced": advanced.map((x) => x.toJson()).toList(),
      };
}

class FolderModel {
  FolderModel ({
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
  List<TileModel> subItems;
  String caption;

  factory FolderModel.fromJson(Map<String, dynamic> json) => FolderModel(
        id: json["id"],
        name: json["name"],
        nameKey: json["nameKey"],
        author: authorValues.map[json["author"]],
        email: emailValues.map[json["email"]],
        isPublic: json["isPublic"],
        hidden: json["hidden"],
        //Create tile objects contained in folder
        subItems:
            json["tiles"].map<TileModel>((x) => TileModel.fromJson(x)).toList(),
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

class TileModel {
  TileModel ({
    this.labelKey,
    this.image,
    this.id,
    this.backgroundColor,
    this.loadBoard,
  });

  String labelKey;
  String image;
  String id;
  Color backgroundColor;
  String loadBoard;

  factory TileModel.fromJson(Map<String, dynamic> json) => TileModel(
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

//Background color values, different between cboard mobile and web
enum BackgroundColor { RGB_255241118, RGB_187222251 }

final backgroundColorValues = EnumValues({
  "rgb(187, 222, 251)": Color(187222251),
  "rgb(255, 241, 118)": Color(255241118)
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
