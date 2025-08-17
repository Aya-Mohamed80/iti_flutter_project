import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/login_repo.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo loginRepo;  // Dependency Injection

  LoginBloc({required this.loginRepo}) : super(const LoginState()) {
    on<LoginEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      try {
        await loginRepo.loginWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(state.copyWith( isLoading: false, isSuccess: true));
      } catch (e) {
        emit(state.copyWith( isLoading: false, errorMessage: e.toString() ));
      }
    });
  }
}
