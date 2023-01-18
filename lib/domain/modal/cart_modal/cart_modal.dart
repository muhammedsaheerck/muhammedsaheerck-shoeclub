// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CartModal? welcomeFromJson(String str) => CartModal.fromJson(json.decode(str));

String welcomeToJson(CartModal? data) => json.encode(data!.toJson());

class CartModal {
  CartModal({
    this.userid,
    this.product,
    this.qty,
  });

  String? userid;
  String? product;
  String? qty;

  factory CartModal.fromJson(Map<String, dynamic> json) => CartModal(
        userid: json["userid"],
        product: json["product"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "product": product,
        "qty": qty,
      };
}
