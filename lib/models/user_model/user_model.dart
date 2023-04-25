class User {
  String? avatar;
  String? email;
  String? username;
  String? name;
  dynamic demoBalance;
  String? depositAddress;
  String? id;
  String? role;
  String? twofaType;
  String? twofaEnable;
  String? phone;
  String? state;
  String? country;

  User();

  User.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    email = json['email'];
    username = json['username'];
    name = json['name'];
    demoBalance = json['demo_balance'];
    depositAddress = json['deposit_address'];
    id = json['id'];
    role = json['role'];
    twofaType = json['twofa_type'];
    twofaEnable = json['twofa_enable'];
    phone = json['phone'];
    state = json['state'];
    country = json['country'];
  }
}
