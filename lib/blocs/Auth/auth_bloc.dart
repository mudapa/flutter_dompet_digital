import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/sign_up_model.dart';
import '../../models/user_model.dart';
import '../../services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      // check email
      if (event is AuthCheckEmail) {
        try {
          // loading
          emit(AuthLoading());

          // check email
          final isEmailExist = await AuthService().checkEmail(event.email);

          // check email success
          if (isEmailExist == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email sudah terdaftar'));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      // register
      if (event is AuthRegister) {
        try {
          // loading
          emit(AuthLoading());

          // register
          final user = await AuthService().register(event.data);

          // register success
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}