class Product {
  List<dynamic> products;
  Product({this.products = const []});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(products: json["products"]);
  }
  Map<String, dynamic> toJson() => {
        "products": products,
      };
}

class ProductModal {
  String? name;

  int? price;

  List<String>? size;

  List<String>? image;

  String? category;

  String? deliveryFee;

  String? description;

  ProductModal({
    this.name,
    this.price,
    this.size,
    this.image,
    this.category,
    this.deliveryFee,
    this.description,
  });

  ProductModal.create({
    required this.name,
    required this.price,
    required this.size,
    required this.image,
    required this.category,
    required this.deliveryFee,
    required this.description,
  });

  factory ProductModal.fromJson(Map<String, dynamic> json) {
    return ProductModal(
      name: json["name"],
      category: json["category"],
      deliveryFee: json["deliveryFee"],
      description: json["description"],
      image: json["image"],
      price: json["price"],
      size: json["size"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "deliveryFee": deliveryFee,
        "description": description,
        "image": image,
        "price": price,
        "size": size,
      };
}
