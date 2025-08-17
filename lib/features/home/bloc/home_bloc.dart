import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/product_model.dart';
import '../repo/home_repo.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo;

  HomeBloc({required this.homeRepo}) : super(const HomeState()) {
    // تحميل المنتجات
    on<LoadProducts>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));

      await emit.forEach<List<ProductModel>>(
        homeRepo.getProductsStream(searchQuery: event.searchQuery),
        onData: (products) =>
            state.copyWith(products: products, isLoading: false),
        onError: (error, _) =>
            state.copyWith(isLoading: false, error: error.toString()),
      );
    });

    // إضافة / إزالة من المفضلة (بالمقارنة عن طريق الـ id)
    on<ToggleFavorite>((event, emit) {
      final favorites = List<ProductModel>.from(state.favorites);

      final index = favorites.indexWhere((p) => p.id == event.product.id);

      if (index >= 0) {
        favorites.removeAt(index);
      } else {
        favorites.add(event.product);
      }

      emit(state.copyWith(favorites: favorites));
    });
  }
}
