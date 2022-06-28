/*import 'package:project_app/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:app_admin/models/models.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Stream<List<Order>> getOrders() {
    return _firebaseFirestore.collection('orders').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
    });
  }

  Future<void> addOrder(Order order) {
    return _firebaseFirestore.collection('products').add(order.toMap());
  }

  Future<void> updateField(
    Order order,
    String field,
    dynamic newValue,
  ) {
    return _firebaseFirestore
        .collection('orders')
        .where('email', isEqualTo: order.email)
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.first.reference.update({field: newValue})
            });
  }
}*/
