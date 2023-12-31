import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/Auth/auth_bloc.dart';
import '../../../models/sign_in_model.dart';
import '../../../shared/helpers.dart';
import '../../../shared/theme.dart';
import '../../widgets/buttons.dart';
import '../../widgets/forms.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showCustomSnackbar(context, 'Email dan Password harus diisi');
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            Container(
              width: 155,
              height: 50,
              margin: const EdgeInsets.only(
                top: 100,
                bottom: 100,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/img_logo_light.png',
                  ),
                ),
              ),
            ),
            Text(
              'Sign In &\nGrow Your Finance',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE: EMAIL INPUT
                  CustomFormField(
                    title: 'Email Address',
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // NOTE: PASSWORD INPUT
                  CustomFormField(
                    title: 'Password',
                    obscureText: true,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password',
                      style: blueTextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthFailed) {
                        showCustomSnackbar(context, state.error);
                      }

                      if (state is AuthSuccess) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home',
                          (route) => false,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return CustomFilledButton(
                        title: 'Sign In',
                        onPressed: () {
                          if (validate()) {
                            context.read<AuthBloc>().add(
                                  AuthLogin(
                                    SignInModel(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  ),
                                );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextButton(
              title: 'Create New Account',
              onPressed: () {
                Navigator.pushNamed(context, '/sign-up');
              },
            ),
          ],
        ),
      ),
    );
  }
}
