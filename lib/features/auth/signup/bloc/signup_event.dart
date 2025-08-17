import 'package:equatable/equatable.dart';
// Equatable + props يمنع إعادة البناء غير الضروري للـ UI

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

class SignupEmailChanged extends SignupEvent {
  final String email;
  const SignupEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class SignupPasswordChanged extends SignupEvent {
  final String password;
  const SignupPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class SignupSubmitted extends SignupEvent {
  final String email;
  final String password;
  const SignupSubmitted({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password]; 
}
