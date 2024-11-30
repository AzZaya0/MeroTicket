// To parse this JSON data, do
//
//     final getEventById = getEventByIdFromJson(jsonString);

import 'dart:convert';

GetEventById getEventByIdFromJson(String str) =>
    GetEventById.fromJson(json.decode(str));

String getEventByIdToJson(GetEventById data) => json.encode(data.toJson());

class GetEventById {
  Data? data;

  GetEventById({
    this.data,
  });

  factory GetEventById.fromJson(Map<String, dynamic> json) => GetEventById(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
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
  List<Vendor>? vendors;
  List<EventTicket>? eventTickets;

  Data({
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
    this.vendors,
    this.eventTickets,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        address: json["address"],
        eventCategory: json["event_category"],
        eventImage: json["event_image"],
        vendors: json["vendors"] == null
            ? []
            : List<Vendor>.from(
                json["vendors"]!.map((x) => Vendor.fromJson(x))),
        eventTickets: json["event_tickets"] == null
            ? []
            : List<EventTicket>.from(
                json["event_tickets"]!.map((x) => EventTicket.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "description": description,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "address": address,
        "event_category": eventCategory,
        "event_image": eventImage,
        "vendors": vendors == null
            ? []
            : List<dynamic>.from(vendors!.map((x) => x.toJson())),
        "event_tickets": eventTickets == null
            ? []
            : List<dynamic>.from(eventTickets!.map((x) => x.toJson())),
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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

class Vendor {
  int? id;
  Venders? venders;

  Vendor({
    this.id,
    this.venders,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        venders:
            json["venders"] == null ? null : Venders.fromJson(json["venders"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "venders": venders?.toJson(),
      };
}

class Venders {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? location;
  String? address;
  String? organizationName;
  String? organizationCategory;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<String>? role;
  String? profileImage;
  String? organizationLogo;

  Venders({
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

  factory Venders.fromJson(Map<String, dynamic> json) => Venders(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        location: json["location"],
        address: json["address"],
        organizationName: json["organization_name"],
        organizationCategory: json["organization_category"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        role: json["role"] == null
            ? []
            : List<String>.from(json["role"]!.map((x) => x)),
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
