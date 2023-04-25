class NotificationsModel {
  int? id;
  String? title;
  String? message;
  String? userId;
  String? link;
  String? category;
  String? read;
  String? createdAt;
  String? updatedAt;

  NotificationsModel();

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    userId = json['user_id'];
    link = json['link'];
    category = json['category'];
    read = json['read'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
