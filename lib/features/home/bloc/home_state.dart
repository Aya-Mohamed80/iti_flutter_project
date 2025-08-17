import 'package:equatable/equatable.dart';
import '../model/product_model.dart';

class HomeState extends Equatable {
  final List<ProductModel> products;
  final List<ProductModel> favorites;
  final bool isLoading;
  final String? error;

  const HomeState({
    this.products = const [],
    this.favorites = const [],
    this.isLoading = false,
    this.error,
  });

 factory HomeState.initial() {
    return HomeState(
      isLoading: false,
      error: null,
      products: [],
      favorites: [],
    );
  }

  HomeState copyWith({
    List<ProductModel>? products,
    List<ProductModel>? favorites,
    bool? isLoading,
    String? error,
  }) {
    
    return HomeState(
      products: products ?? this.products,
      favorites: favorites ?? this.favorites,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [products, favorites, isLoading, error];
}
