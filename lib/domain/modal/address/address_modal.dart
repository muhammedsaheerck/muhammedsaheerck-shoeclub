// To parse this JSON data, do
//
//     final addressModal = addressModalFromJson(jsonString);

import 'dart:convert';

AddressModal addressModalFromJson(String str) =>
    AddressModal.fromJson(json.decode(str));

String addressModalToJson(AddressModal data) => json.encode(data.toJson());

class AddressModal {
  AddressModal({
    this.address,
  });

  List<AddressElements>? address;

  factory AddressModal.fromJson(Map<String, dynamic> json) => AddressModal(
        address:
            List<AddressElements>.from(json["address"].map((x) => AddressElements.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "address": List<dynamic>.from(address!.map((x) => x.toJson())),
      };
}

class AddressElements {
  AddressElements({
    this.id,
    this.user,
    this.title,
    this.fullName,
    this.phone,
    this.pin,
    this.state,
    this.place,
    this.address,
    this.landMark,
  });

  String? id;
  String? user;
  String? title;
  String? fullName;
  String? phone;
  String? pin;
  String? state;
  String? place;
  String? address;
  String? landMark;

  factory AddressElements.fromJson(Map<String, dynamic> json) => AddressElements(
        id: json["_id"],
        user: json["user"],
        title: json["title"],
        fullName: json["fullName"],
        phone: json["phone"],
        pin: json["pin"],
        state: json["state"],
        place: json["place"],
        address: json["address"],
        landMark: json["landMark"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "title": title,
        "fullName": fullName,
        "phone": phone,
        "pin": pin,
        "state": state,
        "place": place,
        "address": address,
        "landMark": landMark,
      };
}
