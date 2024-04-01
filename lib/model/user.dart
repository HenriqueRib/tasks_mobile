class User {
  int? id;
  String? name;
  String? email;
  int? level;

  User({this.id, this.name, this.email, this.level});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['level'] = level;
    return data;
  }
}
