import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fusion_works/modules/skills_screen/skills_store.dart';
import 'package:fusion_works/utils/extensions.dart';
import 'package:provider/provider.dart';

import '../../gen/assets.gen.dart';
import '../../values/app_colors.dart';
import '../../widgets/bottom_tab/bottom_tab.dart';
import '../event_screen/event_screen.dart';
import '../event_screen/event_store.dart';
import '../profileScreen/profile_screen.dart';
import '../profileScreen/profile_screen_store.dart';
import '../skills_screen/skills_screen.dart';
import 'home_store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// Store instance to manage state
  final HomeStore _homeStore = HomeStore();

  // List of widgets representing different pages
  static final List<Widget> _widgetOptions = <Widget>[
    const EventsScreen().withProviders([
      createProviderFor<EventStore>(EventStore()..getAllEvents()),
    ]),
    SkillsScreen().withProviders(
      [
        createProviderFor<SkillsStore>(
          SkillsStore()..fetchUserSkills(),
        ),
      ],
    ),
    const Text('Profile Page'),
    MultiProvider(
      providers: [
        Provider<ProfileScreenStore>(create: (_) => ProfileScreenStore()),
      ],
      child: const ProfileScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) => _widgetOptions[_homeStore.selectedIndex],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Todo: Add on press function for chat fab button
        },
        backgroundColor: AppColors.colorPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Assets.icons.messages2.svg(
          height: 24,
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Observer(
        builder: (_) => BottomTab(
          selectedIndex: _homeStore.selectedIndex,
          onTabSelected: _homeStore.setSelectedIndex,
        ),
      ),
    );
  }
}
