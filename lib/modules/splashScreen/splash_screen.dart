import 'dart:async';

import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../utils/extensions.dart';
import '../../values/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  void _loadWidget() {
    // This will remove splash screen after 3 seconds and push next screen.
    Timer(const Duration(seconds: 3), navigationPage);
  }

  Future<void> navigationPage() async =>
      context.pushReplacementNamed<void, void>(AppRoutes.login);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Assets.images.splash.image(
        height: context.screenSize.height,
        width: context.screenSize.width,
      ),
    );
  }
}
