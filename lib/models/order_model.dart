//import 'dart:convert';
//import 'dart:html';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String email;
  final String fullname;
  final String address;

  static var orders;
  Order({
    required this.email,
    required this.fullname,
    required this.address,
  });
  //int quantity;

  @override
  List<Object> get props {
    return [
      email,
      fullname,
      address,
    ];
  }

  Order copyWith({
    String? email,
    String? fullname,
    String? address,
  }) {
    return Order(
      email: email ?? this.email,
      fullname: fullname ?? this.fullname,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'fullname': fullname});
    result.addAll({'address': address});

    return result;
  }

  factory Order.fromSnapshot(DocumentSnapshot snap) {
    return Order(
      email: snap['email'] ?? '',
      fullname: snap['fullname'] ?? '',
      address: snap['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Product(email: $email, fullname: $fullname, address: $address,)';
  }
}

@override
bool get stringify => true;

List<Order> products = [
  Order(
    email: 'nnn',
    fullname: 'random',
    address: 'brt',
  )
];
