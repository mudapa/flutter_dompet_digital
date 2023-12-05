part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// check email
class AuthCheckEmail extends AuthEvent {
  final String email;

  const AuthCheckEmail(this.email);

  @override
  List<Object> get props => [email];
}

// register
class AuthRegister extends AuthEvent {
  final SignUpModel data;

  const AuthRegister(this.data);

  @override
  List<Object> get props => [data];
}

// login
class AuthLogin extends AuthEvent {
  final SignInModel data;

  const AuthLogin(this.data);

  @override
  List<Object> get props => [data];
}

// get Current User
class AuthGetCurrentUser extends AuthEvent {}
