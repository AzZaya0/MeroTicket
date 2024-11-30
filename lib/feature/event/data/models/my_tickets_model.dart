// To parse this JSON data, do
//
//     final myTicketsModel = myTicketsModelFromJson(jsonString);

import 'dart:convert';

MyTicketsModel myTicketsModelFromJson(String str) => MyTicketsModel.fromJson(json.decode(str));

String myTicketsModelToJson(MyTicketsModel data) => json.encode(data.toJson());

class MyTicketsModel {
    List<Datum>? data;

    MyTicketsModel({
        this.data,
    });

    factory MyTicketsModel.fromJson(Map<String, dynamic> json) => MyTicketsModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    Event? event;
    EventTicket? eventTicket;

    Datum({
        this.id,
        this.event,
        this.eventTicket,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        event: json["event"] == null ? null : Event.fromJson(json["event"]),
        eventTicket: json["event_ticket"] == null ? null : EventTicket.fromJson(json["event_ticket"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "event": event?.toJson(),
        "event_ticket": eventTicket?.toJson(),
    };
}

class Event {
    int? id;
    int? userId;
    String? title;
    String? description;
    DateTime? startDate;
    DateTime? endDate;
    String? startTime;
    String? endTime;
    String? address;
    String? eventCategory;
    String? eventImage;

    Event({
        this.id,
        this.userId,
        this.title,
        this.description,
        this.startDate,
        this.endDate,
        this.startTime,
        this.endTime,
        this.address,
        this.eventCategory,
        this.eventImage,
    });

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        address: json["address"],
        eventCategory: json["event_category"],
        eventImage: json["event_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "description": description,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "address": address,
        "event_category": eventCategory,
        "event_image": eventImage,
    };
}

class EventTicket {
    int? id;
    int? eventId;
    String? ticketType;
    String? ticketPrice;
    dynamic qrCode;
    DateTime? createdAt;
    DateTime? updatedAt;

    EventTicket({
        this.id,
        this.eventId,
        this.ticketType,
        this.ticketPrice,
        this.qrCode,
        this.createdAt,
        this.updatedAt,
    });

    factory EventTicket.fromJson(Map<String, dynamic> json) => EventTicket(
        id: json["id"],
        eventId: json["event_id"],
        ticketType: json["ticket_type"],
        ticketPrice: json["ticket_price"],
        qrCode: json["qr_code"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "event_id": eventId,
        "ticket_type": ticketType,
        "ticket_price": ticketPrice,
        "qr_code": qrCode,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
