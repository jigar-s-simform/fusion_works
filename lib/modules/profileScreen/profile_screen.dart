import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fusion_works/modules/profileScreen/profile_screen_store.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileStore = Provider.of<ProfileScreenStore>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (context) => Text('Data: ${profileStore.userInfo}'),
            ),
            FilledButton(
              onPressed: () {
                profileStore.getProfile('admin@gmail.com');
              },
              child: const Text(
                "Profile",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
