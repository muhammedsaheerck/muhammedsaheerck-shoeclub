// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:shoeclub/domain/modal/product/product_modal.dart';

WishlistModal? welcomeFromJson(String str) =>
    WishlistModal.fromJson(json.decode(str));

String welcomeToJson(WishlistModal? data) => json.encode(data!.toJson());

class WishlistModal {
  WishlistModal({
    this.id,
    this.userId,
    this.products,
    this.v,
  });

  String? id;
  String? userId;
  List<ProductElement?>? products;
  int? v;

  factory WishlistModal.fromJson(Map<String, dynamic> json) => WishlistModal(
        id: json["_id"],
        userId: json["userId"],
        products: json["products"] == null
            ? []
            : List<ProductElement?>.from(
                json["products"]!.map((x) => ProductElement.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x!.toJson())),
        "__v": v,
      };
}

class ProductElement {
  ProductElement({
    this.product,
    this.id,
  });

  Product? product;
  String? id;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: Product.fromJson(json["product"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product": product!.toJson(),
        "_id": id,
      };
}
