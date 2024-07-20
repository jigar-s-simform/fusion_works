import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fusion_works/values/strings.dart';

class FwTextFormField extends StatefulWidget {
  const FwTextFormField({
    required this.title,
    required this.hintText,
    required this.prefixSvgIconPath,
    required this.inputType,
    required this.textInputAction,
    required this.controller,
    this.suffixSvgIconPath,
    this.showPassword = false,
    this.validator,
    super.key,
  });

  final String title;
  final String hintText;
  final String prefixSvgIconPath;
  final String? suffixSvgIconPath;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final bool showPassword;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  State<FwTextFormField> createState() => _FwTextFormFieldState();
}

class _FwTextFormFieldState extends State<FwTextFormField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          keyboardType: TextInputType.emailAddress,
          obscureText: widget.showPassword && obscurePassword,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: theme.textTheme.bodyMedium,
            contentPadding: const EdgeInsets.all(16),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: SvgPicture.asset(
                height: 16,
                width: 16,
                widget.prefixSvgIconPath,
              ),
            ),
            suffixIcon: widget.suffixSvgIconPath == null
                ? null
                : IconButton(
                    icon: obscurePassword == true
                        ? SvgPicture.asset(AssetsString.eyeCloseIcon)
                        : SvgPicture.asset(AssetsString.eyeOpenIcon),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                      print("Password: $obscurePassword");
                    },
                  ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color.fromRGBO(213, 213, 221, 1),
              ),
            ),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(16),
          ],
          validator: widget.validator,
        ),
      ],
    );
  }
}
