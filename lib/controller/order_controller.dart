/*import 'dart:ffi';

import 'package:project_app/models/order_model.dart';
import 'package:project_app/models/product_model.dart';
import 'package:project_app/services/database_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final DatabaseService database = DatabaseService();
  var orders = <Order>[].obs;

  @override
  void onInit() {
    orders.bindStream(database.getOrders());
    super.onInit();
  }

  var newOrder = {}.obs;
  get email => newOrder['email'];
  get fullname => newOrder['fullname'];
  get address => newOrder['address'];
}*/
