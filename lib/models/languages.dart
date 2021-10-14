class Languages {
  int total;
  int page;
  int limit;
  int offset;
  String sort;
  String search;
  List<Data> data;

  Languages(
      {this.total,
      this.page,
      this.limit,
      this.offset,
      this.sort,
      this.search,
      this.data});

  Languages.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    offset = json['offset'];
    sort = json['sort'];
    search = json['search'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['sort'] = this.sort;
    data['search'] = this.search;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  bool arabic;
  String sId;
  String locale;
  String displayName;
  String skin;
  String hair;
  int iV;

  Data(
      {this.arabic,
      this.sId,
      this.locale,
      this.displayName,
      this.skin,
      this.hair,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    arabic = json['arabic'];
    sId = json['_id'];
    locale = json['locale'];
    displayName = json['displayName'];
    skin = json['skin'];
    hair = json['hair'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arabic'] = this.arabic;
    data['_id'] = this.sId;
    data['locale'] = this.locale;
    data['displayName'] = this.displayName;
    data['skin'] = this.skin;
    data['hair'] = this.hair;
    data['__v'] = this.iV;
    return data;
  }
}
