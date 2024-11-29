// To parse this JSON data, do
//
//     final createAccountModel = createAccountModelFromJson(jsonString);

import 'dart:convert';

CreateAccountModel createAccountModelFromJson(String str) =>
    CreateAccountModel.fromJson(json.decode(str));

String createAccountModelToJson(CreateAccountModel data) =>
    json.encode(data.toJson());

class CreateAccountModel {
  Data? data;
  String? message;

  CreateAccountModel({
    this.data,
    this.message,
  });

  factory CreateAccountModel.fromJson(Map<String, dynamic> json) =>
      CreateAccountModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? location;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.location,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        location: json["location"],
        address: json["address"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "location": location,
        "address": address,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
