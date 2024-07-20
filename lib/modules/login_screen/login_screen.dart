import 'package:flutter/material.dart';
import 'package:fusion_works/utils/common_widgets/fw_button.dart';
import 'package:fusion_works/utils/common_widgets/fw_text_form_field.dart';
import 'package:fusion_works/utils/common_widgets/horizontal_divider.dart';
import 'package:fusion_works/utils/common_widgets/switch_authentication_widget.dart';
import 'package:fusion_works/utils/helpers/validators.dart';
import 'package:fusion_works/values/app_colors.dart';
import 'package:fusion_works/values/strings.dart';

import '../../utils/common_widgets/fw_outlined_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 76),
                Text(
                  AppStrings.login,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  AppStrings.loginUsing,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Montserrat',
                    color: AppColors.loginLightText,
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
                const SizedBox(height: 24),
                FwButton(
                  text: AppStrings.login,
                  setOnClickListener: () {
                    loginFormKey.currentState?.save();
                    loginFormKey.currentState?.validate();
                    final isNotEmpty = emailController.text.trim().isNotEmpty &&
                        passwordController.text.trim().isNotEmpty;
                    if (isNotEmpty) {
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
                  title: AppStrings.dontHaveAccount,
                  highlightedTitle: AppStrings.register,
                  onTapPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.register);
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
