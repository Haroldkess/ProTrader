class UsernameModel {
  String? userName;

  UsernameModel({
    required this.userName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = userName;

    return data;
  }
}
