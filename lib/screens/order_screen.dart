/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:project_app/controller/order_controller.dart';
import 'package:project_app/models/order_model.dart';
import 'package:project_app/services/database_services.dart';
import 'package:project_app/widgets/custom_appbar.dart';

class OrderScreen extends StatelessWidget {
  final OrderController orderController = Get.find();
  //StorageService storage = StorageService();
  DatabaseService database = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: 'Order'),
    body: SingleChildScrollView(
                    child: Text(
                      'CUSTOMER INFORMATION',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    _buildTextFormField('Email', 'email', orderController),
                    _buildTextFormField(
                        'Full Name', 'fullname', orderController),
                    _buildTextFormField('Address', 'address', orderController),
                    const SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            database.addOrder(Order(
                              email: orderController.newOrder['email'],
                              fullname: orderController.newOrder['fullname'],
                              address: orderController.newOrder['address'],
                            ));
                          },
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )),
                    ),
    ));
    
  }
  TextFormField _buildTextFormField(
      String hintText, String name, OrderController orderController) {
    return TextFormField(
        decoration: InputDecoration(hintText: hintText),
        onChanged: (value) {
          orderController.newOrder.update(
            name,
            (_) => value,
            ifAbsent: () => value,
          );
        });
}*/
