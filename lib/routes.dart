import 'package:flutter/material.dart';
import 'package:fusion_works/apibase/repository.dart';
import 'package:fusion_works/utils/extensions.dart';

import 'modules/home_screen/home_screen.dart';
import 'modules/profile_screen/profile_screen.dart';
import 'modules/profile_screen/profile_screen_store.dart';
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
      case AppRoutes.txtAfterSplash:
        return getRoute(
          widget: const HomeScreen(),
        );
      case AppRoutes.profile:
        return getRoute(
          widget: const ProfileScreen().withProvider(
            ProfileScreenStore(Repository.instance),
          ),
        );

      /// An invalid route. User shouldn't see this, it's for debugging purpose
      /// only.
      default:
        return getRoute(widget: const InvalidRoute());
    }
  }
}
