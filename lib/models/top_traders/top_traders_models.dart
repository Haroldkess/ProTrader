class TopTradersModel {
  String? userId;
  String? pnl;
  User? user;


  TopTradersModel({this.userId, this.pnl, this.user});

  TopTradersModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    pnl = json['pnl'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['pnl'] = this.pnl;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? avatar;
  String? email;

  User({this.id, this.name, this.avatar, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json["avatar"];
    email = json["email"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    return data;
  }
}
