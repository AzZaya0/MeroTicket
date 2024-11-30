// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

TokenModel tokenModelFromJson(String str) =>
    TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  String? token;
  String? accessToken;

  TokenModel({
    this.token,
    this.accessToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        token: json["token"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "accessToken": accessToken,
      };
}
