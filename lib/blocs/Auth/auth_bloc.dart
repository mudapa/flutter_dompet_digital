import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/sign_in_model.dart';
import '../../models/sign_up_model.dart';
import '../../models/user_edit_model.dart';
import '../../models/user_model.dart';
import '../../services/auth_service.dart';
import '../../services/user_service.dart';
import '../../services/wallet_service.dart';

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

      // login
      if (event is AuthLogin) {
        try {
          // loading
          emit(AuthLoading());

          // login
          final user = await AuthService().login(event.data);

          // login success
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      // get current user
      if (event is AuthGetCurrentUser) {
        try {
          // loading
          emit(AuthLoading());

          // get current user
          final SignInModel data = await AuthService().getCredentialFromLocal();

          final UserModel user = await AuthService().login(data);

          // get current user success
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      // update user
      if (event is AuthUpdateUser) {
        try {
          if (state is AuthSuccess) {
            final updatedUser = (state as AuthSuccess).user.copyWith(
                  username: event.data.username,
                  name: event.data.name,
                  email: event.data.email,
                  password: event.data.password,
                );

            // loading
            emit(AuthLoading());

            // update user
            await UserService().updateUser(event.data);

            // update user success
            emit(AuthSuccess(updatedUser));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      // update pin
      if (event is AuthUpdatePin) {
        try {
          if (state is AuthSuccess) {
            final updatedPin = (state as AuthSuccess).user.copyWith(
                  pin: event.newPin,
                );

            // loading
            emit(AuthLoading());

            // update pin
            await WalletService().updatePin(
              event.oldPin,
              event.newPin,
            );

            // update pin success
            emit(AuthSuccess(updatedPin));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      // logout
      if (event is AuthLogout) {
        try {
          // loading
          emit(AuthLoading());

          // logout
          await AuthService().logout();

          // logout success
          emit(AuthInitial());
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
