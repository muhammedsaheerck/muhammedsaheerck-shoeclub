// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

import 'package:shoeclub/domain/modal/cart/cart_modal.dart';
import 'package:shoeclub/domain/modal/product/product_modal.dart';
import 'package:shoeclub/domain/modal/whishlist/wishlist_modal.dart';

List<OrderModal> addressModelFromJson(String str) =>
    List<OrderModal>.from(json.decode(str).map((x) => OrderModal.fromJson(x)));

String addressModelToJson(List<OrderModal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModal {
  OrderModal({
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

  factory OrderModal.fromJson(Map<String, dynamic> json) => OrderModal(
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
