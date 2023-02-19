// To parse this JSON data, do
//
//     final modelsdata = modelsdataFromJson(jsonString);

import 'dart:convert';

Modelsdata modelsdataFromJson(String str) => Modelsdata.fromJson(json.decode(str));

String modelsdataToJson(Modelsdata data) => json.encode(data.toJson());

class Modelsdata {
  Modelsdata({
    this.response,
    this.data,
  });

  Response? response;
  Data? data;

  factory Modelsdata.fromJson(Map<String, dynamic> json) => Modelsdata(
    response: json["response"] == null ? null : Response.fromJson(json["response"]),
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response?.toJson(),
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.count,
    this.bookingDates,
    this.result,
  });

  int? count;
  List<DateTime>? bookingDates;
  Map<String, List<Result>>? result;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    count: json["count"],
    bookingDates: json["booking_dates"] == null ? [] : List<DateTime>.from(json["booking_dates"]!.map((x) => DateTime.parse(x))),
    result: Map.from(json["result"]!).map((k, v) => MapEntry<String, List<Result>>(k, List<Result>.from(v.map((x) => Result.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "booking_dates": bookingDates == null ? [] : List<dynamic>.from(bookingDates!.map((x) => "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
    "result": Map.from(result!).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
  };
}

class Result {
  Result({
    this.id,
    this.bookingId,
    this.totalPrice,
    this.categoryName,
    this.subcategoryName,
    this.planType,
    this.estimatedTime,
    this.pets,
    this.serviceImage,
    this.serviceDate,
    this.serviceSession,
    this.serviceTime,
    this.addons,
    this.bookingAddress,
    this.bedrooms,
    this.bathrooms,
    this.areaSize,
    this.userNotes,
    this.vendorNotes,
    this.status,
    this.bookingStatus,
    this.paymentStatus,
    this.bugsType,
    this.showCompleteAcceptButton,
    this.reason,
    this.hearUs,
    this.otherHearUs,
    this.receiverToken,
    this.receiverId,
    this.senderToken,
    this.senderId,
    this.vendorDetails,
  });

  String? id;
  String? bookingId;
  String? totalPrice;
  CategoryName? categoryName;
  String? subcategoryName;
  PlanType? planType;
  String? estimatedTime;
  Pets? pets;
  List<String>? serviceImage;
  DateTime? serviceDate;
  ServiceSession? serviceSession;
  ServiceTime? serviceTime;
  List<Addon>? addons;
  BookingAddress? bookingAddress;
  String? bedrooms;
  String? bathrooms;
  AreaSize? areaSize;
  String? userNotes;
  VendorNotes? vendorNotes;
  String? status;
  BookingStatus? bookingStatus;
  PaymentStatus? paymentStatus;
  BugsType? bugsType;
  Pets? showCompleteAcceptButton;
  String? reason;
  HearUs? hearUs;
  String? otherHearUs;
  ReceiverToken? receiverToken;
  String? receiverId;
  SenderToken? senderToken;
  String? senderId;
  VendorDetails? vendorDetails;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    bookingId: json["booking_id"],
    totalPrice: json["total_price"],
    categoryName: categoryNameValues.map[json["category_name"]]!,
    subcategoryName: json["subcategory_name"],
    planType: planTypeValues.map[json["plan_type"]]!,
    estimatedTime: json["estimated_time"],
    pets: petsValues.map[json["pets"]]!,
    serviceImage: json["service_image"] == null ? [] : List<String>.from(json["service_image"]!.map((x) => x)),
    serviceDate: json["service_date"] == null ? null : DateTime.parse(json["service_date"]),
    serviceSession: serviceSessionValues.map[json["service_session"]]!,
    serviceTime: serviceTimeValues.map[json["service_time"]]!,
    addons: json["addons"] == null ? [] : List<Addon>.from(json["addons"]!.map((x) => Addon.fromJson(x))),
    bookingAddress: json["booking_address"] == null ? null : BookingAddress.fromJson(json["booking_address"]),
    bedrooms: json["bedrooms"],
    bathrooms: json["bathrooms"],
    areaSize: areaSizeValues.map[json["area_size"]]!,
    userNotes: json["user_notes"],
    vendorNotes: vendorNotesValues.map[json["vendor_notes"]]!,
    status: json["status"],
    bookingStatus: bookingStatusValues.map[json["booking_status"]]!,
    paymentStatus: paymentStatusValues.map[json["payment_status"]]!,
    bugsType: bugsTypeValues.map[json["bugs_type"]]!,
    showCompleteAcceptButton: petsValues.map[json["show_complete_accept_button"]]!,
    reason: json["reason"],
    hearUs: hearUsValues.map[json["hear_us"]]!,
    otherHearUs: json["other_hear_us"],
    receiverToken: receiverTokenValues.map[json["receiver_token"]]!,
    receiverId: json["receiver_id"],
    senderToken: senderTokenValues.map[json["sender_token"]]!,
    senderId: json["sender_id"],
    vendorDetails: json["vendor_details"] == null ? null : VendorDetails.fromJson(json["vendor_details"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_id": bookingId,
    "total_price": totalPrice,
    "category_name": categoryNameValues.reverse[categoryName],
    "subcategory_name": subcategoryName,
    "plan_type": planTypeValues.reverse[planType],
    "estimated_time": estimatedTime,
    "pets": petsValues.reverse[pets],
    "service_image": serviceImage == null ? [] : List<dynamic>.from(serviceImage!.map((x) => x)),
    "service_date": "${serviceDate!.year.toString().padLeft(4, '0')}-${serviceDate!.month.toString().padLeft(2, '0')}-${serviceDate!.day.toString().padLeft(2, '0')}",
    "service_session": serviceSessionValues.reverse[serviceSession],
    "service_time": serviceTimeValues.reverse[serviceTime],
    "addons": addons == null ? [] : List<dynamic>.from(addons!.map((x) => x.toJson())),
    "booking_address": bookingAddress?.toJson(),
    "bedrooms": bedrooms,
    "bathrooms": bathrooms,
    "area_size": areaSizeValues.reverse[areaSize],
    "user_notes": userNotes,
    "vendor_notes": vendorNotesValues.reverse[vendorNotes],
    "status": status,
    "booking_status": bookingStatusValues.reverse[bookingStatus],
    "payment_status": paymentStatusValues.reverse[paymentStatus],
    "bugs_type": bugsTypeValues.reverse[bugsType],
    "show_complete_accept_button": petsValues.reverse[showCompleteAcceptButton],
    "reason": reason,
    "hear_us": hearUsValues.reverse[hearUs],
    "other_hear_us": otherHearUs,
    "receiver_token": receiverTokenValues.reverse[receiverToken],
    "receiver_id": receiverId,
    "sender_token": senderTokenValues.reverse[senderToken],
    "sender_id": senderId,
    "vendor_details": vendorDetails?.toJson(),
  };
}

class Addon {
  Addon({
    this.name,
    this.qty,
  });

  String? name;
  String? qty;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    name: json["name"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "qty": qty,
  };
}

enum AreaSize { EMPTY, THE_14_ACRE }

final areaSizeValues = EnumValues({
  "": AreaSize.EMPTY,
  "1/4 Acre": AreaSize.THE_14_ACRE
});

class BookingAddress {
  BookingAddress({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.apartment,
    this.city,
    this.state,
    this.zipcode,
  });

  String? name;
  BookingAddressEmail? email;
  String? phone;
  String? address;
  String? apartment;
  City? city;
  States? state;
  String? zipcode;

  factory BookingAddress.fromJson(Map<String, dynamic> json) => BookingAddress(
    name: json["name"],
    email: bookingAddressEmailValues.map[json["email"]]!,
    phone: json["phone"],
    address: json["address"],
    apartment: json["apartment"],
    city: cityValues.map[json["city"]]!,
    state: stateValues.map[json["state"]]!,
    zipcode: json["zipcode"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": bookingAddressEmailValues.reverse[email],
    "phone": phone,
    "address": address,
    "apartment": apartment,
    "city": cityValues.reverse[city],
    "state": stateValues.reverse[state],
    "zipcode": zipcode,
  };
}

enum City { PHOENIX, LAS_VEGAS, TETS, CITY_LAS_VEGAS }

final cityValues = EnumValues({
  "las vegas": City.CITY_LAS_VEGAS,
  "Las Vegas": City.LAS_VEGAS,
  "Phoenix": City.PHOENIX,
  "tets": City.TETS
});

enum BookingAddressEmail { ROYALINKDEV_GMAIL_COM }

final bookingAddressEmailValues = EnumValues({
  "royalinkdev@gmail.com": BookingAddressEmail.ROYALINKDEV_GMAIL_COM
});

enum States { ARIZONA, NV, NEVADA, ABBREVIATION, STATE_NEVADA }

final stateValues = EnumValues({
  "Abbreviation": States.ABBREVIATION,
  "Arizona": States.ARIZONA,
  "Nevada": States.NEVADA,
  "NV": States.NV,
  "nevada": States.STATE_NEVADA
});

enum BookingStatus { SERVICE_COMPLETED, SKIPPED, SCHEDULED, PENDING_PROVIDER_ACCEPTANCE }

final bookingStatusValues = EnumValues({
  "Pending Provider Acceptance": BookingStatus.PENDING_PROVIDER_ACCEPTANCE,
  "Scheduled": BookingStatus.SCHEDULED,
  "Service Completed": BookingStatus.SERVICE_COMPLETED,
  "Skipped": BookingStatus.SKIPPED
});

enum BugsType { EMPTY, CRICKETS_SPIDERS }

final bugsTypeValues = EnumValues({
  "Crickets,Spiders": BugsType.CRICKETS_SPIDERS,
  "": BugsType.EMPTY
});

enum CategoryName { HOUSE_CLEANING, LANDSCAPE_MAINTENANCE, POOL_SERVICE, PEST_CONTROL, WINDOW_WASHING }

final categoryNameValues = EnumValues({
  "House Cleaning": CategoryName.HOUSE_CLEANING,
  "Landscape Maintenance": CategoryName.LANDSCAPE_MAINTENANCE,
  "Pest Control": CategoryName.PEST_CONTROL,
  "Pool Service": CategoryName.POOL_SERVICE,
  "Window Washing": CategoryName.WINDOW_WASHING
});

enum HearUs { EMPTY, INSTAGRAM, FACEBOOK }

final hearUsValues = EnumValues({
  "": HearUs.EMPTY,
  "Facebook": HearUs.FACEBOOK,
  "Instagram": HearUs.INSTAGRAM
});

enum PaymentStatus { SUCCESS, PENDING }

final paymentStatusValues = EnumValues({
  "Pending": PaymentStatus.PENDING,
  "Success": PaymentStatus.SUCCESS
});

enum Pets { NO }

final petsValues = EnumValues({
  "no": Pets.NO
});

enum PlanType { WEEKLY, BI_WEEKLY, BI_MONTHLY }

final planTypeValues = EnumValues({
  "Bi-Monthly": PlanType.BI_MONTHLY,
  "Bi-Weekly": PlanType.BI_WEEKLY,
  "Weekly": PlanType.WEEKLY
});

enum ReceiverToken { THE_2_NR5_BR_AO_BQFP_J61, THE_12_DRSMI_NFT_LTQ_VC5 }

final receiverTokenValues = EnumValues({
  "12drsmiNftLtqVc5": ReceiverToken.THE_12_DRSMI_NFT_LTQ_VC5,
  "2Nr5BrAOBqfpJ61": ReceiverToken.THE_2_NR5_BR_AO_BQFP_J61
});

enum SenderToken { THE_1_U6_CD7_RA_RIT_W_KH_R }

final senderTokenValues = EnumValues({
  "1U6Cd7raRitWKhR": SenderToken.THE_1_U6_CD7_RA_RIT_W_KH_R
});

enum ServiceSession { MORNING, AFTERNOON }

final serviceSessionValues = EnumValues({
  "Afternoon": ServiceSession.AFTERNOON,
  "Morning": ServiceSession.MORNING
});

enum ServiceTime { THE_0700_AM_1200_PM, THE_1200_PM_0600_PM }

final serviceTimeValues = EnumValues({
  "07:00 AM - 12:00 PM": ServiceTime.THE_0700_AM_1200_PM,
  "12:00 PM - 06:00 PM": ServiceTime.THE_1200_PM_0600_PM
});

class VendorDetails {
  VendorDetails({
    this.name,
    this.companyName,
    this.email,
    this.profileImg,
    this.mobile,
  });

  Name? name;
  CompanyName? companyName;
  VendorDetailsEmail? email;
  String? profileImg;
  String? mobile;

  factory VendorDetails.fromJson(Map<String, dynamic> json) => VendorDetails(
    name: nameValues.map[json["name"]]!,
    companyName: companyNameValues.map[json["company_name"]]!,
    email: vendorDetailsEmailValues.map[json["email"]]!,
    profileImg: json["profile_img"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "company_name": companyNameValues.reverse[companyName],
    "email": vendorDetailsEmailValues.reverse[email],
    "profile_img": profileImg,
    "mobile": mobile,
  };
}

enum CompanyName { TEST_COMPANY, TEST_COMPANY_2, KC_CLEANERS }

final companyNameValues = EnumValues({
  "KC Cleaners": CompanyName.KC_CLEANERS,
  "Test Company": CompanyName.TEST_COMPANY,
  "Test Company 2": CompanyName.TEST_COMPANY_2
});

enum VendorDetailsEmail { ROYALINKDESIGNLV_GMAIL_COM, ROYALINKDESIGNLVTEST_GMAIL_COM, MARIELA_ROYALINKDESIGN_COM }

final vendorDetailsEmailValues = EnumValues({
  "mariela@royalinkdesign.com": VendorDetailsEmail.MARIELA_ROYALINKDESIGN_COM,
  "royalinkdesignlvtest@gmail.com": VendorDetailsEmail.ROYALINKDESIGNLVTEST_GMAIL_COM,
  "royalinkdesignlv@gmail.com": VendorDetailsEmail.ROYALINKDESIGNLV_GMAIL_COM
});

enum Name { THAI_CLEAN, HOUSE_CLEANING, MARIELA_ARGUETA }

final nameValues = EnumValues({
  "House Cleaning": Name.HOUSE_CLEANING,
  "Mariela Argueta": Name.MARIELA_ARGUETA,
  "Thai Clean": Name.THAI_CLEAN
});

enum VendorNotes { EMPTY, TESTING_TESTING }

final vendorNotesValues = EnumValues({
  "": VendorNotes.EMPTY,
  "Testing testing": VendorNotes.TESTING_TESTING
});

class Response {
  Response({
    this.responseCode,
    this.responseMessage,
  });

  String? responseCode;
  String? responseMessage;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    responseCode: json["response_code"],
    responseMessage: json["response_message"],
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "response_message": responseMessage,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
