import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fusion_works/modules/profileScreen/profile_screen_store.dart';
import 'package:fusion_works/values/app_colors.dart';
import 'package:fusion_works/values/strings.dart';
import 'package:provider/provider.dart';

import '../../utils/common_widgets/profile_list_view_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileStore = Provider.of<ProfileScreenStore>(context);
    final theme = Theme.of(context);

    // profileStore.getProfile('admin@gmail.com');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Image.network(
                    "https://cdn.icon-icons.com/icons2/3150/PNG/512/user_profile_female_icon_192701.png",
                    height: 56,
                    width: 56,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe",
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        "UX Designer",
                        style: theme.textTheme.titleSmall
                            ?.copyWith(color: AppColors.darkGrey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AssetsString.logoutIcon),
                  ),
                ],
              ),
            ),
            const ProfileListViewTile(
              svgImagePath: AssetsString.emailIcon,
              title: AppStrings.email,
              subtitle: 'johndoe@simformsolutions.com',
            ),
            const ProfileListViewTile(
              svgImagePath: AssetsString.callIcon,
              title: AppStrings.mobileNumber,
              subtitle: '+91 00000 00000',
            ),
            const ProfileListViewTile(
              svgImagePath: AssetsString.employeeCardIcon,
              title: AppStrings.employeeCode,
              subtitle: '#2564',
            ),
            const ProfileListViewTile(
              svgImagePath: AssetsString.calendarIcon,
              title: AppStrings.dateOfBirth,
              subtitle: '20/10/1997',
            ),
          ],
        ),
      ),
    );
  }
}
