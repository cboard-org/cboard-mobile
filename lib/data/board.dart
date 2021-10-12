
import 'package:cboard_mobile/data/data.dart';

class BoardModel {

  String name;
  String author;
  String email;
  String format;
  String caption;
  bool isPublic;
  String locale;
  List<Tile> tiles;

  BoardModel({
    this.name,
    this.author,
    this.email,
    this.format,
    this.caption,
    this.isPublic,
    this.locale,
    this.tiles,
});

  // BoardModel.fromJSON(Map<String,dynamic> json){
  //   name = json["name"];
  //   author = json["author"];
  //   email= json["email"];
  //   format = json["format"];
  //   caption = json["caption"];
  //   isPublic = json["isPublic"];
  //   locale = json["locale"];
  //   tiles = [];
  //
  //   json["tiles"].forEach((e) {
  //     tiles.add(Tile.fromJSON(e));
  //   });
  // }

  // {
  // "name": "{{board_name}}",
  // "author": "Postman Test",
  // "email": "{{email}}",
  // "format":  "obf",
  // "tiles": [
  // {}
  // ],
  // "caption": "string",
  // "isPublic": true,
  // "locale": "ar-SA"
  // }
}