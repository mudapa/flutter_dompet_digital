import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/Auth/auth_bloc.dart';
import '../../../../shared/helpers.dart';
import '../../../../shared/theme.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/profile_menu_item.dart';
import 'profile_edit_page.dart';
import 'profile_edit_pin_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            color: blackColor,
          ),
        ),
        title: const Text(
          'My Profile',
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(
              context,
              state.error,
            );
          }

          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/sign-in',
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

          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 22,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: state.user.profilePicture == null
                                ? const AssetImage('assets/img_profile.png')
                                : NetworkImage(
                                    state.user.profilePicture!,
                                  ) as ImageProvider,
                          ),
                        ),
                        child: state.user.verified == 1
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: whiteColor,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check_circle,
                                      color: greenColor,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        state.user.name!,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_edit_profile.png',
                        title: 'Edit Profile',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ProfileEditPage();
                                },
                              ),
                            );
                          }
                        },
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_pin.png',
                        title: 'My Pin',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProfileEditPinPage(),
                              ),
                            );
                          }
                        },
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_wallet.png',
                        title: 'Wallet Settings',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_reward.png',
                        title: 'My Rewards',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_help.png',
                        title: 'Help Center',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_logout.png',
                        title: 'Log Out',
                        onTap: () {
                          context.read<AuthBloc>().add(AuthLogout());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 87,
                ),
                CustomTextButton(
                  title: 'Report a Problem',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
