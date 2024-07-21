import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fusion_works/generated/l10n.dart';
import 'package:fusion_works/values/strings.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'routes.dart';
import 'utils/extensions.dart';
import 'values/app_colors.dart';
import 'values/app_theme.dart';
import 'values/app_theme_store.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

NavigatorState get navigator => navigatorKey.currentState!;

class FusionWorksApp extends StatelessWidget {
  const FusionWorksApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeStore = context.provide<AppThemeStore>();
    return Observer(
      builder: (context) {
        return SkeletonizerConfig(
          data: const SkeletonizerConfigData(
            enableSwitchAnimation: true,
            effect: ShimmerEffect(
              baseColor: AppColors.lightGrey,
              highlightColor: AppColors.lightGreen,
            ),
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeStore.themeMode,
            localizationsDelegates: const [Str.delegate],
            supportedLocales: Str.delegate.supportedLocales,
            initialRoute: AppRoutes.splash,
            onGenerateRoute: Routes.generateRoute,
            navigatorKey: navigatorKey,
          ),
        );
      },
    );
  }
}
