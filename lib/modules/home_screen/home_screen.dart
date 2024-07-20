import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../gen/assets.gen.dart';
import '../../values/app_colors.dart';
import '../../widgets/bottom_tab/bottom_tab.dart';
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
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Search Page'),
    Text('Profile Page'),
    Text('Winter Page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) => Center(
            // Display the selected page based on index
            child: _widgetOptions.elementAt(_homeStore.selectedIndex),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Todo: Add on press function for chat fab button
        },
        backgroundColor: AppColors.blue,
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
