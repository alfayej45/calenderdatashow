// To parse this JSON data, do
//
//     final eventModelsdata = eventModelsdataFromJson(jsonString);

import 'dart:convert';

List<EventModelsdata> eventModelsdataFromJson(String str) => List<EventModelsdata>.from(json.decode(str).map((x) => EventModelsdata.fromJson(x)));

String eventModelsdataToJson(List<EventModelsdata> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventModelsdata {
  EventModelsdata({
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
  int? projectId;
  String? calendar;
  DateTime? start;
  DateTime? end;
  String? meetingDate;
  String? meetingTime;
  String? allDay;
  String? url;
  String? guests;
  String? location;
  String? description;
  int? createdBy;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? clientId;
  int? providerId;
  AppointmentStatus? appointmentStatus;
  dynamic email;
  dynamic phone;
  Status? status;
  dynamic eTag;
  dynamic googleCalender;
  AppointmentStatus? recurringStatus;
  AppointmentStatus? recurringType;
  dynamic leadId;

  factory EventModelsdata.fromJson(Map<String, dynamic> json) => EventModelsdata(
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
    appointmentStatus: appointmentStatusValues.map[json["appointment_status"]]!,
    email: json["email"],
    phone: json["phone"],
    status: statusValues.map[json["status"]]!,
    eTag: json["e_tag"],
    googleCalender: json["google_calender"],
    recurringStatus: appointmentStatusValues.map[json["recurring_status"]]!,
    recurringType: appointmentStatusValues.map[json["recurring_type"]]!,
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
    "appointment_status": appointmentStatusValues.reverse[appointmentStatus],
    "email": email,
    "phone": phone,
    "status": statusValues.reverse[status],
    "e_tag": eTag,
    "google_calender": googleCalender,
    "recurring_status": appointmentStatusValues.reverse[recurringStatus],
    "recurring_type": appointmentStatusValues.reverse[recurringType],
    "lead_id": leadId,
  };
}

enum AppointmentStatus { NO }

final appointmentStatusValues = EnumValues({
  "no": AppointmentStatus.NO
});

enum Status { PENDING }

final statusValues = EnumValues({
  "Pending": Status.PENDING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
