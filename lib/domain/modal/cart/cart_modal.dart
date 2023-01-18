// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:shoeclub/domain/modal/product/product_modal.dart';

CartModal? welcomeFromJson(String str) => CartModal.fromJson(json.decode(str));

String welcomeToJson(CartModal? data) => json.encode(data!.toJson());

class CartModal {
  CartModal({
    this.id,
    this.userid,
    this.products,
    this.totalPrice,
    this.v,
  });

  String? id;
  String? userid;
  List<ProductElementCart?>? products;
  int? totalPrice;
  int? v;

  factory CartModal.fromJson(Map<String, dynamic> json) => CartModal(
        id: json["_id"],
        userid: json["userid"],
        products: json["products"] == null
            ? []
            : List<ProductElementCart?>.from(
                json["products"]!.map((x) => ProductElementCart.fromJson(x))),
        totalPrice: json["totalPrice"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userid": userid,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x!.toJson())),
        "totalPrice": totalPrice,
        "__v": v,
      };
}

class ProductElementCart {
  ProductElementCart({
    this.product,
    this.size,
    this.qty,
    this.price,
    this.id,
  });

  Product? product;
  String? size;
  int? qty;
  int? price;
  String? id;

  factory ProductElementCart.fromJson(Map<String, dynamic> json) => ProductElementCart(
        product: Product.fromJson(json["product"]),
        size: json["size"],
        qty: json["qty"],
        price: json["price"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product": product!.toJson(),
        "size": size,
        "qty": qty,
        "price": price,
        "_id": id,
      };
}
