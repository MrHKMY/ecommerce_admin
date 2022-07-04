import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  double price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
    this.price = 0,
    this.quantity = 0,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      category,
      description,
      imageUrl,
      isRecommended,
      isPopular,
      price,
      quantity,
    ];
  }

  Product copyWith({
    int? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    bool? isRecommended,
    bool? isPopular,
    double? price,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isRecommended: isRecommended ?? this.isRecommended,
      isPopular: isPopular ?? this.isPopular,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'category': category});
    result.addAll({'description': description});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'isRecommended': isRecommended});
    result.addAll({'isPopular': isPopular});
    result.addAll({'price': price});
    result.addAll({'quantity': quantity});

    return result;
  }

  factory Product.fromSnapshot(DocumentSnapshot map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      isRecommended: map['isRecommended'] ?? false,
      isPopular: map['isPopular'] ?? false,
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Product(id: $id, name: $name, category: $category, description: $description, imageUrl: $imageUrl, isRecommended: $isRecommended, isPopular: $isPopular, price: $price, quantity: $quantity)';
  }

  static List<Product> products = [
    Product(
        id: 1,
        name: "Smoothies #1",
        category: "Smoothies",
        description: "Just another product description",
        imageUrl:
            'https://images.unsplash.com/photo-1557799852-67fdf88b1b01?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        price: 1.99,
        isRecommended: true,
        isPopular: false),
    Product(
        id: 2,
        name: "Smoothies #2",
        category: "Smoothies",
        description: "Just another product description",
        imageUrl:
            'https://images.unsplash.com/photo-1557799852-67fdf88b1b01?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        price: 2.99,
        isRecommended: false,
        isPopular: false),
    Product(
        id: 3,
        name: "Smoothies #3",
        category: "Smoothies",
        description: "Just another product description",
        imageUrl:
            'https://images.unsplash.com/photo-1557799852-67fdf88b1b01?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        price: 3.99,
        isRecommended: true,
        isPopular: true),
    Product(
        id: 4,
        name: "Smoothies #4",
        category: "Smoothies",
        description: "Just another product description",
        imageUrl:
            'https://images.unsplash.com/photo-1557799852-67fdf88b1b01?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        price: 4.99,
        isRecommended: false,
        isPopular: true),
    Product(
        id: 5,
        name: "Soft Drink #1",
        category: "Soft Drink",
        description: "Just another product description",
        imageUrl:
            'https://images.unsplash.com/photo-1527960471264-932f39eb5846?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        price: 1.99,
        isRecommended: true,
        isPopular: false),
    Product(
        id: 6,
        name: "Soft Drink #2",
        category: "Soft Drink",
        description: "Just another product description",
        imageUrl:
            'https://images.unsplash.com/photo-1527960471264-932f39eb5846?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        price: 2.99,
        isRecommended: false,
        isPopular: true),
  ];
}
