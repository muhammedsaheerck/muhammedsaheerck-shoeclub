// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

import 'package:shoeclub/domain/modal/cart/cart_modal.dart';

OrderModal orderModalFromJson(String str) =>
    OrderModal.fromJson(json.decode(str));

String orderModalToJson(OrderModal data) => json.encode(data.toJson());

class OrderModal {
  OrderModal({
    this.orders,
  });

  List<Orders>? orders;

  factory OrderModal.fromJson(Map<String, dynamic> json) => OrderModal(
        orders:
            List<Orders>.from(json["orders"].map((x) => Orders.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Orders {
  Orders({
    this.id,
    this.addressId,
    this.userid,
    this.products,
    this.paymentType,
    this.paymentStatus,
    this.orderStatus,
    this.fullName,
    this.phone,
    this.pin,
    this.state,
    this.place,
    this.address,
    this.orderDate,
    this.deliveryDate,
    this.cancelDate,
    this.totalPrice,
  });

  String? id;
  String? addressId;
  String? userid;
  List<ProductElementCart?>? products;
  String? paymentType;
  bool? paymentStatus;
  String? orderStatus;
  String? fullName;
  String? phone;
  String? pin;
  String? state;
  String? place;
  String? address;
  DateTime? orderDate;
  DateTime? deliveryDate;
  dynamic cancelDate;
  int? totalPrice;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        id: json["_id"],
        products: json["products"] == null
            ? []
            : List<ProductElementCart>.from(
                json["products"]!.map((x) => ProductElementCart.fromJson(x))),
        paymentType: json["paymentType"],
        paymentStatus: json["paymentStatus"],
        orderStatus: json["orderStatus"],
        fullName: json["fullName"],
        phone: json["phone"],
        pin: json["pin"],
        state: json["state"],
        place: json["place"],
        address: json["address"],
        orderDate: json["orderDate"] == null
            ? null
            : DateTime.parse(json["orderDate"]),
        deliveryDate: json["deliveryDate"] == null
            ? null
            : DateTime.parse(json["deliveryDate"]),
        cancelDate: json["cancelDate"],
        totalPrice: json["totalPrice"],
        addressId: json["addressId"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x!.toJson())),
        "paymentType": paymentType,
        "paymentStatus": paymentStatus,
        "orderStatus": orderStatus,
        "fullName": fullName,
        "phone": phone,
        "pin": pin,
        "state": state,
        "place": place,
        "address": address,
        "orderDate": orderDate?.toIso8601String(),
        "deliveryDate": deliveryDate?.toIso8601String(),
        "cancelDate": cancelDate,
        "totalPrice": totalPrice,
        "userid": userid,
        "addressId": addressId,
      };
}
