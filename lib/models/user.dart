class User {
  String name;
  String locale;
  String email;
  String password;
  String birthdate;
  String id;

  User(
      {this.name,
      this.locale,
      this.email,
      this.password,
      this.birthdate,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    locale = json['locale'];
    email = json['email'];
    password = json['password'];
    birthdate = json['birthdate'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['locale'] = this.locale;
    data['email'] = this.email;
    data['password'] = this.password;
    data['birthdate'] = this.birthdate;
    data['id'] = this.id;
    return data;
  }
}
