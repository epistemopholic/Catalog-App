// ignore_for_file: null_closures

import 'dart:convert';

class CatalogModel {
  static List<Product> products = [];

  static Product getById(int id) =>
      products.firstWhere((element) => element.id == id, orElse: null);

  static Product getByPostion(int pos) => products[pos];
}

class Product {
  int id;
  String name;
  String desc;
  int price;
  String color;
  String image;

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  Product copyWith({
    int? id,
    String? name,
    String? desc,
    int? price,
    String? color,
    String? image,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}


// class CatalogModel {
//   static List<Product> products = [];
// }

// class Product {
//   Product({
//     required this.id,
//     required this.name,
//     required this.desc,
//     required this.price,
//     required this.color,
//     required this.image,
//   });

//   int id;
//   String name;
//   String desc;
//   int price;
//   String color;
//   String image;

//   factory Product.fromMap(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         name: json["name"],
//         desc: json["desc"],
//         price: json["price"],
//         color: json["color"],
//         image: json["image"],
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "name": name,
//         "desc": desc,
//         "price": price,
//         "color": color,
//         "image": image,
//       };
// }
