import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fusion_works/modules/profileScreen/profile_screen_store.dart';
import 'package:fusion_works/utils/extensions.dart';
import 'package:fusion_works/utils/helpers/dummy_data.dart';
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
        title: const Text('Profile'),
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
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DummyData.getRandomFullName(),
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        DummyData.getRandomDesignation(),
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
            ProfileListViewTile(
              svgImagePath: AssetsString.callIcon,
              title: AppStrings.mobileNumber,
              subtitle: DummyData.getRandomMobileNumber(),
            ),
            ProfileListViewTile(
              svgImagePath: AssetsString.employeeCardIcon,
              title: DummyData.getRandomEmployeeCode().toString(),
              subtitle: '#2564',
            ),
            ProfileListViewTile(
              svgImagePath: AssetsString.calendarIcon,
              title: AppStrings.dateOfBirth,
              subtitle: DummyData.getDobFromIso(
                  DummyData.generateRandomDateOfBirth()),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Projects',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ProfileListViewTile(
              svgImagePath: AssetsString.briefcase,
              title: 'Your Projects',
              subtitle: '20 Projects',
              trailingIcon: Icons.arrow_forward_ios,
              onTap: () => context.pushNamed<void>(AppRoutes.projectList),
            ),
          ],
        ),
      ),
    );
  }
}
