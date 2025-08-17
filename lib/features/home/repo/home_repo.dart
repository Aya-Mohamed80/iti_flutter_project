import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/product_model.dart';

class HomeRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ProductModel>> getProductsStream({String? searchQuery}) {
    Query query = _firestore.collection('products').orderBy('name');

    if (searchQuery != null && searchQuery.isNotEmpty) {
      query = query
          .where('name', isGreaterThanOrEqualTo: searchQuery)
          .where('name', isLessThanOrEqualTo: '$searchQuery\uf8ff');
    }

    return query.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => ProductModel.fromFirestore(doc)).toList());
  }
}
