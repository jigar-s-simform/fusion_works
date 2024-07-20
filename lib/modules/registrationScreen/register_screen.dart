import 'package:flutter/material.dart';
import 'package:fusion_works/utils/common_widgets/fw_button.dart';
import 'package:fusion_works/utils/common_widgets/fw_text_form_field.dart';
import 'package:fusion_works/utils/common_widgets/horizontal_divider.dart';
import 'package:fusion_works/utils/common_widgets/switch_authentication_widget.dart';
import 'package:fusion_works/utils/helpers/validators.dart';
import 'package:fusion_works/values/app_colors.dart';
import 'package:fusion_works/values/strings.dart';

import '../../utils/common_widgets/fw_outlined_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: registerFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 76),
                Text(
                  AppStrings.register,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  AppStrings.registerUsing,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Montserrat',
                    color: AppColors.registerLightText,
                  ),
                ),
                const SizedBox(height: 32),
                FwTextFormField(
                  title: AppStrings.email,
                  hintText: AppStrings.enterYourEmail,
                  prefixSvgIconPath: AssetsString.emailIcon,
                  inputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: Validator.isValidEmail,
                  controller: emailController,
                ),
                const SizedBox(height: 12),
                FwTextFormField(
                  showPassword: true,
                  title: AppStrings.password,
                  hintText: AppStrings.enterYourEmailPassword,
                  prefixSvgIconPath: AssetsString.passwordIcon,
                  suffixSvgIconPath: AssetsString.eyeOpenIcon,
                  inputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  validator: Validator.isValidPassword,
                  controller: passwordController,
                ),
                const SizedBox(height: 12),
                FwTextFormField(
                  showPassword: true,
                  title: AppStrings.confirmPassword,
                  hintText: AppStrings.enterYourEmailPasswordAgain,
                  prefixSvgIconPath: AssetsString.passwordIcon,
                  suffixSvgIconPath: AssetsString.eyeOpenIcon,
                  inputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  validator: Validator.isValidPassword,
                  controller: confirmPasswordController,
                ),
                const SizedBox(height: 24),
                FwButton(
                  text: AppStrings.register,
                  setOnClickListener: () {
                    registerFormKey.currentState?.save();
                    final isFieldValid =
                        registerFormKey.currentState?.validate() ?? false;
                    final isNotEmpty = passwordController.text.isNotEmpty &&
                        confirmPasswordController.text.isNotEmpty;
                    final isSame = passwordController.text.trim() ==
                        confirmPasswordController.text.trim();
                    if (isFieldValid && isNotEmpty && isSame) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Success"),
                        ),
                      );
                    } else if (isNotEmpty && isFieldValid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text(ApiErrorStrings.yourPasswordDoesNotMatches),
                        ),
                      );
                    } else if (isNotEmpty && isSame) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Success"),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 18),
                SwitchAuthenticatinWidget(
                  title: AppStrings.alreadyMember,
                  highlightedTitle: AppStrings.login,
                  onTapPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.login);
                  },
                ),
                const SizedBox(height: 32),
                const HorizontalDivider(AppStrings.oR),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FwOutlinedButton(
                      title: AppStrings.microsoft,
                      pngIconPath: AssetsString.microsoftIcon,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    FwOutlinedButton(
                      title: AppStrings.google,
                      pngIconPath: AssetsString.googleIcon,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
