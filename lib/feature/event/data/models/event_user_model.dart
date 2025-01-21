// To parse this JSON data, do
//
//     final eventUserModel = eventUserModelFromJson(jsonString);

import 'dart:convert';

EventUserModel eventUserModelFromJson(String str) => EventUserModel.fromJson(json.decode(str));

String eventUserModelToJson(EventUserModel data) => json.encode(data.toJson());

class EventUserModel {
    List<Datum>? data;

    EventUserModel({
        this.data,
    });

    factory EventUserModel.fromJson(Map<String, dynamic> json) => EventUserModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    EventUsers? eventUsers;

    Datum({
        this.id,
        this.eventUsers,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        eventUsers: json["event_users"] == null ? null : EventUsers.fromJson(json["event_users"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "event_users": eventUsers?.toJson(),
    };
}

class EventUsers {
    int? id;
    String? name;
    String? email;
    String? phone;
    String? location;
    String? address;
    dynamic organizationName;
    dynamic organizationCategory;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<String>? role;
    dynamic profileImage;
    dynamic organizationLogo;

    EventUsers({
        this.id,
        this.name,
        this.email,
        this.phone,
        this.location,
        this.address,
        this.organizationName,
        this.organizationCategory,
        this.createdAt,
        this.updatedAt,
        this.role,
        this.profileImage,
        this.organizationLogo,
    });

    factory EventUsers.fromJson(Map<String, dynamic> json) => EventUsers(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        location: json["location"],
        address: json["address"],
        organizationName: json["organization_name"],
        organizationCategory: json["organization_category"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        role: json["role"] == null ? [] : List<String>.from(json["role"]!.map((x) => x)),
        profileImage: json["profile_image"],
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "role": role == null ? [] : List<dynamic>.from(role!.map((x) => x)),
        "profile_image": profileImage,
        "organization_logo": organizationLogo,
    };
}
