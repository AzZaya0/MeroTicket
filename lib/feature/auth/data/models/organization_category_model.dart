// To parse this JSON data, do
//
//     final organizationCategoryModel = organizationCategoryModelFromJson(jsonString);

import 'dart:convert';

OrganizationCategoryModel organizationCategoryModelFromJson(String str) => OrganizationCategoryModel.fromJson(json.decode(str));

String organizationCategoryModelToJson(OrganizationCategoryModel data) => json.encode(data.toJson());

class OrganizationCategoryModel {
    List<String>? data;

    OrganizationCategoryModel({
        this.data,
    });

    factory OrganizationCategoryModel.fromJson(Map<String, dynamic> json) => OrganizationCategoryModel(
        data: json["data"] == null ? [] : List<String>.from(json["data"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
    };
}
