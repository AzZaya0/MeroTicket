// To parse this JSON data, do
//
//     final createEventModel = createEventModelFromJson(jsonString);

import 'dart:convert';

CreateEventModel createEventModelFromJson(String str) =>
    CreateEventModel.fromJson(json.decode(str));

String createEventModelToJson(CreateEventModel data) =>
    json.encode(data.toJson());

class CreateEventModel {
  Data? data;
  String? message;

  CreateEventModel({
    this.data,
    this.message,
  });

  factory CreateEventModel.fromJson(Map<String, dynamic> json) =>
      CreateEventModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  int? userId;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  String? address;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Data({
    this.userId,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.address,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        address: json["address"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "title": title,
        "description": description,
        "start_date": startDate,
        "end_date": endDate,
        "start_time": startTime,
        "end_time": endTime,
        "address": address,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
