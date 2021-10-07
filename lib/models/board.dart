class Board {
  String name;
  String author;
  String email;
  String format;
  List<Tiles> tiles;
  String caption;
  bool isPublic;
  String locale;

  Board(
      {this.name,
      this.author,
      this.email,
      this.format,
      this.tiles,
      this.caption,
      this.isPublic,
      this.locale});

  Board.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    author = json['author'];
    email = json['email'];
    format = json['format'];
    if (json['tiles'] != null) {
      tiles = new List<Tiles>();
      json['tiles'].forEach((v) {
        tiles.add(new Tiles.fromJson(v));
      });
    }
    caption = json['caption'];
    isPublic = json['isPublic'];
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['author'] = this.author;
    data['email'] = this.email;
    data['format'] = this.format;
    if (this.tiles != null) {
      data['tiles'] = this.tiles.map((v) => v.toJson()).toList();
    }
    data['caption'] = this.caption;
    data['isPublic'] = this.isPublic;
    data['locale'] = this.locale;
    return data;
  }
}

class Tiles {
  String labelKey;
  String image;
  String id;
  String backgroundColor;

  Tiles({this.labelKey, this.image, this.id, this.backgroundColor});

  Tiles.fromJson(Map<String, dynamic> json) {
    labelKey = json['labelKey'];
    image = json['image'];
    id = json['id'];
    backgroundColor = json['backgroundColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labelKey'] = this.labelKey;
    data['image'] = this.image;
    data['id'] = this.id;
    data['backgroundColor'] = this.backgroundColor;
    return data;
  }
}
