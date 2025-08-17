import 'package:equatable/equatable.dart';
import '../model/product_model.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadProducts extends HomeEvent {
  final String? searchQuery;

  const LoadProducts({this.searchQuery});

  @override
  List<Object?> get props => [searchQuery];
}

class ToggleFavorite extends HomeEvent {
  final ProductModel product;

  const ToggleFavorite(this.product);

  @override
  List<Object?> get props => [product];
}
