// To parse this JSON data, do
//
//     final vendorCreateAccountModel = vendorCreateAccountModelFromJson(jsonString);

import 'dart:convert';

VendorCreateAccountModel vendorCreateAccountModelFromJson(String str) =>
    VendorCreateAccountModel.fromJson(json.decode(str));

String vendorCreateAccountModelToJson(VendorCreateAccountModel data) =>
    json.encode(data.toJson());

class VendorCreateAccountModel {
  Data? data;
  String? message;

  VendorCreateAccountModel({
    this.data,
    this.message,
  });

  factory VendorCreateAccountModel.fromJson(Map<String, dynamic> json) =>
      VendorCreateAccountModel(
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
  dynamic location;
  String? address;
  String? organizationName;
  String? organizationCategory;
  List<String>? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? organizationLogo;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.location,
    this.address,
    this.organizationName,
    this.organizationCategory,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.organizationLogo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        location: json["location"],
        address: json["address"],
        organizationName: json["organization_name"],
        organizationCategory: json["organization_category"],
        role: json["role"] == null
            ? []
            : List<String>.from(json["role"]!.map((x) => x)),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        organizationLogo: json["organization_logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "location": location,
        "address": address,
        "organization_name": organizationName,
        "organization_category": organizationCategory,
        "role": role == null ? [] : List<dynamic>.from(role!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "organization_logo": organizationLogo,
      };
}
