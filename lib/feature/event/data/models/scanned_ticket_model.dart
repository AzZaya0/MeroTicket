// To parse this JSON data, do
//
//     final scannedTicketModel = scannedTicketModelFromJson(jsonString);

import 'dart:convert';

ScannedTicketModel scannedTicketModelFromJson(String str) =>
    ScannedTicketModel.fromJson(json.decode(str));

String scannedTicketModelToJson(ScannedTicketModel data) =>
    json.encode(data.toJson());

class ScannedTicketModel {
  Data? data;
  String? message;

  ScannedTicketModel({
    this.data,
    this.message,
  });

  factory ScannedTicketModel.fromJson(Map<String, dynamic> json) =>
      ScannedTicketModel(
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
  int? userId;
  int? ticketId;
  int? eventId;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.userId,
    this.ticketId,
    this.eventId,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        ticketId: json["ticket_id"],
        eventId: json["event_id"],
        price: json["price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "ticket_id": ticketId,
        "event_id": eventId,
        "price": price,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
