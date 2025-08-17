import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/signup_repo.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupRepo signupRepo;

  SignupBloc({required this.signupRepo}) : super(const SignupState()) {
    on<SignupEmailChanged>((event, emit) { // handler
      emit(state.copyWith(email: event.email));
    });

    on<SignupPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<SignupSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      try {
        await signupRepo.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } catch (e) {
        emit(state.copyWith( isLoading: false, errorMessage: e.toString() ));
      }
    });
  }
}
