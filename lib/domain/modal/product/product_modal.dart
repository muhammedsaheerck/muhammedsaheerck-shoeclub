// class Product {
//   List<dynamic> products;
//   Product({this.products = const []});
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(products: json["products"]);
//   }
//   Map<String, dynamic> toJson() => {
//         "products": products,
//       };
// }

// class ProductModal {
//   String? name;

//   int? price;

//   List<String>? size;

//   List<String>? image;

//   String? category;

//   String? deliveryFee;

//   String? description;

//   ProductModal({
//     this.name,
//     this.price,
//     this.size,
//     this.image,
//     this.category,
//     this.deliveryFee,
//     this.description,
//   });

//   ProductModal.create({
//     required this.name,
//     required this.price,
//     required this.size,
//     required this.image,
//     required this.category,
//     required this.deliveryFee,
//     required this.description,
//   });

//   factory ProductModal.fromJson(Map<String, dynamic> json) {
//     return ProductModal(
//       name: json["name"],
//       category: json["category"],
//       deliveryFee: json["deliveryFee"],
//       description: json["description"],
//       image: json["image"],
//       price: json["price"],
//       size: json["size"],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "category": category,
//         "deliveryFee": deliveryFee,
//         "description": description,
//         "image": image,
//         "price": price,
//         "size": size,
//       };
// }
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProductModal? welcomeFromJson(String str) => ProductModal.fromJson(json.decode(str));

String welcomeToJson(ProductModal? data) => json.encode(data!.toJson());

class ProductModal {
    ProductModal({
        this.products,
    });

    List<Product?>? products;

    factory ProductModal.fromJson(Map<String, dynamic> json) => ProductModal(
        products: json["products"] == null ? [] : List<Product?>.from(json["products"]!.map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x!.toJson())),
    };
}

class Product {
    Product({
        this.id,
        this.name,
        this.price,
        this.size,
        this.image,
        this.category,
        this.deliveryFee,
        this.description,
        this.v,
    });

    String? id;
    String? name;
    int? price;
    List<String?>? size;
    List<String?>? image;
    String? category;
    String? deliveryFee;
    String? description;
    int? v;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        size: json["size"] == null ? [] : List<String?>.from(json["size"]!.map((x) => x)),
        image: json["image"] == null ? [] : List<String?>.from(json["image"]!.map((x) => x)),
        category: json["category"],
        deliveryFee: json["deliveryFee"],
        description: json["description"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "size": size == null ? [] : List<dynamic>.from(size!.map((x) => x)),
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "category": category,
        "deliveryFee": deliveryFee,
        "description": description,
        "__v": v,
    };
}
