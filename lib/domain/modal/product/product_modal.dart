import 'dart:convert';

ProductModal? productModalFromJson(String str) =>
    ProductModal.fromJson(json.decode(str));

String productModalToJson(ProductModal? data) => json.encode(data!.toJson());

class ProductModal {
  ProductModal({
    this.products,
  });

  List<Product?>? products;

  factory ProductModal.fromJson(Map<String, dynamic> json) => ProductModal(
        products: json["products"] == null
            ? []
            : List<Product?>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x!.toJson())),
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
        size: json["size"] == null
            ? []
            : List<String?>.from(json["size"]!.map((x) => x)),
        image: json["image"] == null
            ? []
            : List<String?>.from(json["image"]!.map((x) => x)),
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
