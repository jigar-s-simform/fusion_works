import 'package:flutter/material.dart';
import 'package:fusion_works/env/env.dart';

import 'app_config.dart';
import 'flavors/flavor.dart';
import 'flavors/flavor_config.dart';
import 'flavors/flavor_values.dart';
import 'services/shared_prefs.dart';
import 'utils/helpers/helpers.dart';
import 'utils/network_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkUtils.initialize();
  await SharedPrefs.initialise();
  setAppOrientation();
  setupLogging();
  runApp(const FlavoredApp());
}

class FlavoredApp extends StatelessWidget {
  const FlavoredApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlavorConfig(
      flavor: Flavor.dev,
      values: FlavorValues(
        baseUrl: Env.baseUrl,
        baseUrlModel: Env.baseUrlModel,
      ),
      child: const AppConfig(),
    );
  }
}
