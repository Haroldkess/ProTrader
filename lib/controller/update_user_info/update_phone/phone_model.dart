class PhoneModel {
 
  String? phone;


  PhoneModel({required this.phone,});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["phone"] = phone;
   
    return data;
  }
}