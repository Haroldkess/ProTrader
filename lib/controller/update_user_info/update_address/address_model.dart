

class AddressModel {
  String? country;
  String? state;

  AddressModel({required this.country, required this.state});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["state"] = state;
    data["country"] = country;

    return data;
  }
}
