class PasswordModel {
  String? old;
  String? newPass;
  String? confirm;

  PasswordModel({
    required this.old,
    required this.newPass,
    required this.confirm,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["old_password"] = old;
    data["new_password"] = newPass;
    data["confirm_password"] = confirm;

    return data;
  }
}
