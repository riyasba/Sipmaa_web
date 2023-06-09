// To parse this JSON data, do
//
//     final notificationListModel = notificationListModelFromJson(jsonString);

import 'dart:convert';

NotificationListModel notificationListModelFromJson(String str) =>
    NotificationListModel.fromJson(json.decode(str));

String notificationListModelToJson(NotificationListModel data) =>
    json.encode(data.toJson());

class NotificationListModel {
  String message;
  List<ListElement> list;

  NotificationListModel({
    required this.message,
    required this.list,
  });

  factory NotificationListModel.fromJson(Map<String, dynamic> json) =>
      NotificationListModel(
        message: json["message"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  dynamic id;
  String title;
  String message;
  dynamic recipientId;
  dynamic notifiableType;
  dynamic notifyId;
  dynamic data;
  dynamic readAt;
  DateTime createdAt;
  DateTime updatedAt;

  ListElement({
    this.id,
    required this.title,
    required this.message,
    required this.recipientId,
    required this.notifiableType,
    required this.notifyId,
    required this.data,
    this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        title: json["title"],
        message: json["message"],
        recipientId: json["recipient_id"],
        notifiableType: json["notifiable_type"],
        notifyId: json["notify_id"],
        data: json["data"],
        readAt: json["read_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "message": message,
        "recipient_id": recipientId,
        "notifiable_type": notifiableType,
        "notify_id": notifyId,
        "data": data,
        "read_at": readAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
