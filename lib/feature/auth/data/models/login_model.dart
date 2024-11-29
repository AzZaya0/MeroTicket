// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    Data? data;
    String? message;

    LoginModel({
        this.data,
        this.message,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
    };
}

class Data {
    User? user;
    String? token;

    Data({
        this.user,
        this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
    };
}

class User {
    int? id;
    String? name;
    String? email;
    String? phone;
    String? location;
    String? address;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic profileImage;

    User({
        this.id,
        this.name,
        this.email,
        this.phone,
        this.location,
        this.address,
        this.createdAt,
        this.updatedAt,
        this.profileImage,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        location: json["location"],
        address: json["address"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        profileImage: json["profile_image"],
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
        "profile_image": profileImage,
    };
}
