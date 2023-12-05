import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/Auth/auth_bloc.dart';
import '../../../../models/user_edit_model.dart';
import '../../../../shared/helpers.dart';
import '../../../../shared/theme.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/forms.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<AuthBloc>().state;
    if (state is AuthSuccess) {
      usernameController.text = state.user.username!;
      nameController.text = state.user.name!;
      emailController.text = state.user.email!;
      passwordController.text = state.user.password!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
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
                CustomFormField(
                  title: 'Username',
                  controller: usernameController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: 'Full Name',
                  controller: nameController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: 'Email Address',
                  controller: emailController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: 'Password',
                  obscureText: true,
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthFailed) {
                      showCustomSnackbar(
                        context,
                        state.error,
                      );
                    }

                    if (state is AuthSuccess) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/profile-edit-success',
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
                      title: 'Update Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthUpdateUser(
                                UserEditModel(
                                  username: usernameController.text,
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              ),
                            );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
