import 'package:flutter/widgets.dart';

import '../ui/pages/main/home_page.dart';
import '../ui/pages/main/pin_page.dart';
import '../ui/pages/main/profile/profile_edit_success_page.dart';
import '../ui/pages/main/profile/profile_page.dart';
import '../ui/pages/main/topup/topup_page.dart';
import '../ui/pages/main/topup/topup_success.dart';
import '../ui/pages/onboarding_page.dart';
import '../ui/pages/signUp/sign_up_page.dart';
import '../ui/pages/signUp/sign_up_set_ktp_page.dart';
import '../ui/pages/signUp/sign_up_set_profile_page.dart';
import '../ui/pages/signUp/sign_up_success_page.dart';
import '../ui/pages/signIn/sign_in_page.dart';
import '../ui/pages/splash_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes => {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/sign-up-set-profile': (context) => const SignUpSetProfilePage(),
        '/sign-up-set-ktp': (context) => const SignUpSetKtpPage(),
        '/sign-up-success': (context) => const SignUpSuccessPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/pin': (context) => const PinPage(),
        '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
        '/topup': (context) => const TopupPage(),
        '/topup-success': (context) => const TopupSuccessPage(),
      };
}
