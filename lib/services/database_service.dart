import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin/models/order_models.dart';
import 'package:ecommerce_admin/models/product_models.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
    return _firebaseFirestore
        .collection("products")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((e) => Product.fromSnapshot(e)).toList();
    });
  }

  Stream<List<Order>> getOrders() {
    return _firebaseFirestore.collection("orders").snapshots().map((snapshot) {
      return snapshot.docs.map((e) => Order.fromSnapshot(e)).toList();
    });
  }

  Stream<List<Order>> getPendingOrders() {
    return _firebaseFirestore
        .collection("orders")
        .where('isDelivered', isEqualTo: false)
        .where('isCancelled', isEqualTo: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((e) => Order.fromSnapshot(e)).toList();
    });
  }

  Future<void> addProduct(Product product) {
    return _firebaseFirestore.collection("products").add(product.toMap());
  }

  Future<void> updateField(
    Product product,
    String field,
    dynamic newValue,
  ) {
    return _firebaseFirestore
        .collection("products")
        .where("id", isEqualTo: product.id)
        .get()
        .then((value) => {
              value.docs.first.reference.update({field: newValue})
            });
  }

  Future<void> updateOrder(
    Order order,
    String field,
    dynamic newValue,
  ) {
    return _firebaseFirestore
        .collection("orders")
        .where("id", isEqualTo: order.id)
        .get()
        .then((value) => {
              value.docs.first.reference.update({field: newValue})
            });
  }
}
