import 'package:iti_project/core/utiles/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  // هنا بنعرف طريقة تحويل بيانات Firestore لكائن من نوع ProductModel
  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProductModel(
      id: doc.id,
      name: data[AppStrings.name] ?? '',
      imageUrl: data[AppStrings.imageUrl] ?? '',
      price: (data[AppStrings.price] is int)
          ? (data[AppStrings.price] as int).toDouble()
          : (data[AppStrings.price] ?? 0.0),
    );
  }
}
