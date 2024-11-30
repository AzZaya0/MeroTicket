// To parse this JSON data, do
//
//     final searchVendorModel = searchVendorModelFromJson(jsonString);

import 'dart:convert';

SearchVendorModel searchVendorModelFromJson(String str) =>
    SearchVendorModel.fromJson(json.decode(str));

String searchVendorModelToJson(SearchVendorModel data) =>
    json.encode(data.toJson());

class SearchVendorModel {
  List<Datum>? data;

  SearchVendorModel({
    this.data,
  });

  factory SearchVendorModel.fromJson(Map<String, dynamic> json) =>
      SearchVendorModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? name;
  String? email;
  String? phone;
  dynamic location;
  String? address;
  dynamic organizationName;
  dynamic organizationCategory;
  List<String>? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? organizationLogo;

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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

  // Override == operator and hashCode for comparison
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Datum && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
