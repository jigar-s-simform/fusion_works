import 'package:flutter/material.dart';
import 'package:fusion_works/modules/chat/chat_store.dart';
import 'package:fusion_works/modules/skills_screen/add_skills_screen.dart';
import 'package:fusion_works/utils/extensions.dart';

import 'modules/chat/chat_screen.dart';
import 'modules/home_screen/home_screen.dart';
import 'modules/login_screen/login_screen.dart';
import 'modules/login_screen/login_screen_store.dart';
import 'modules/profileScreen/profile_screen.dart';
import 'modules/profileScreen/profile_screen_store.dart';
import 'modules/registrationScreen/register_screen.dart';
import 'modules/registrationScreen/register_screen_store.dart';
import 'modules/splashScreen/splash_screen.dart';
import 'utils/common_widgets/invalid_route.dart';
import 'values/strings.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route<dynamic> getRoute({
      required Widget widget,
      bool fullscreenDialog = false,
    }) {
      return MaterialPageRoute<void>(
        builder: (context) => widget,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    }

    switch (settings.name) {
      case AppRoutes.splash:
        return getRoute(
          widget: const SplashScreen(),
        );
      case AppRoutes.addSkills:
        return getRoute(
          widget: AddSkillsScreen(),
        );
      case AppRoutes.txtAfterSplash:
        return getRoute(
          widget: const HomeScreen(),
        );
      case AppRoutes.profile:
        return getRoute(
          widget: const ProfileScreen().withProvider(
            ProfileScreenStore(),
          ),
        );
      case AppRoutes.chatScreen:
        return getRoute(
          widget: const ChatScreen().withProvider(ChatStore()),
        );
      case AppRoutes.login:
        return getRoute(
          widget: const LoginScreen().withProvider(
            LoginScreenStore(),
          ),
        );
      case AppRoutes.register:
        return getRoute(
          widget: const RegisterScreen().withProvider(
            RegisterScreenStore(),
          ),
        );

      /// An invalid route. User shouldn't see this, it's for debugging purpose
      /// only.
      default:
        return getRoute(widget: const InvalidRoute());
    }
  }
}
