// To parse this JSON data, do
//
//     final detailsEventModelsdata = detailsEventModelsdataFromJson(jsonString);

import 'dart:convert';

DetailsEventModelsdata detailsEventModelsdataFromJson(String str) => DetailsEventModelsdata.fromJson(json.decode(str));

String detailsEventModelsdataToJson(DetailsEventModelsdata data) => json.encode(data.toJson());

class DetailsEventModelsdata {
  DetailsEventModelsdata({
    this.id,
    this.title,
    this.projectId,
    this.calendar,
    this.start,
    this.end,
    this.meetingDate,
    this.meetingTime,
    this.allDay,
    this.url,
    this.guests,
    this.location,
    this.description,
    this.createdBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.clientId,
    this.providerId,
    this.appointmentStatus,
    this.email,
    this.phone,
    this.status,
    this.eTag,
    this.googleCalender,
    this.recurringStatus,
    this.recurringType,
    this.leadId,
  });

  int? id;
  String? title;
  dynamic projectId;
  String? calendar;
  DateTime? start;
  DateTime? end;
  dynamic meetingDate;
  dynamic meetingTime;
  String? allDay;
  dynamic url;
  dynamic guests;
  dynamic location;
  dynamic description;
  dynamic createdBy;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic clientId;
  dynamic providerId;
  String? appointmentStatus;
  dynamic email;
  dynamic phone;
  String? status;
  dynamic eTag;
  dynamic googleCalender;
  String? recurringStatus;
  String? recurringType;
  dynamic leadId;

  factory DetailsEventModelsdata.fromJson(Map<String, dynamic> json) => DetailsEventModelsdata(
    id: json["id"],
    title: json["title"],
    projectId: json["project_id"],
    calendar: json["calendar"],
    start: json["start"] == null ? null : DateTime.parse(json["start"]),
    end: json["end"] == null ? null : DateTime.parse(json["end"]),
    meetingDate: json["meeting_date"],
    meetingTime: json["meeting_time"],
    allDay: json["allDay"],
    url: json["url"],
    guests: json["guests"],
    location: json["location"],
    description: json["description"],
    createdBy: json["created_by"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    clientId: json["client_id"],
    providerId: json["provider_id"],
    appointmentStatus: json["appointment_status"],
    email: json["email"],
    phone: json["phone"],
    status: json["status"],
    eTag: json["e_tag"],
    googleCalender: json["google_calender"],
    recurringStatus: json["recurring_status"],
    recurringType: json["recurring_type"],
    leadId: json["lead_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "project_id": projectId,
    "calendar": calendar,
    "start": start?.toIso8601String(),
    "end": end?.toIso8601String(),
    "meeting_date": meetingDate,
    "meeting_time": meetingTime,
    "allDay": allDay,
    "url": url,
    "guests": guests,
    "location": location,
    "description": description,
    "created_by": createdBy,
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "client_id": clientId,
    "provider_id": providerId,
    "appointment_status": appointmentStatus,
    "email": email,
    "phone": phone,
    "status": status,
    "e_tag": eTag,
    "google_calender": googleCalender,
    "recurring_status": recurringStatus,
    "recurring_type": recurringType,
    "lead_id": leadId,
  };
}
