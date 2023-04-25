// To parse this JSON data, do
//
//     final alertModel = alertModelFromJson(jsonString);

import 'dart:convert';

AlertModel alertModelFromJson(String str) => AlertModel.fromJson(json.decode(str));

String alertModelToJson(AlertModel data) => json.encode(data.toJson());

class AlertModel {
    AlertModel({
        this.success,
        this.data,
    });

    bool? success;
    List<AlertData>? data;

    factory AlertModel.fromJson(Map<String, dynamic> json) => AlertModel(
        success: json["success"],
        data: json["data"] == null ? [] : List<AlertData>.from(json["data"]!.map((x) => AlertData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class AlertData {
    AlertData({
        this.id,
        this.title,
        this.message,
        this.userId,
        this.link,
        this.category,
        this.read,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? title;
    String? message;
    String? userId;
    String? link;
    String? category;
    String? read;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory AlertData.fromJson(Map<String, dynamic> json) => AlertData(
        id: json["id"],
        title: json["title"],
        message: json["message"],
        userId: json["user_id"],
        link: json["link"],
        category: json["category"],
        read: json["read"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "message": message,
        "user_id": userId,
        "link": link,
        "category": category,
        "read": read,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

