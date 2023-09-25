import 'package:flutter/material.dart';

import '../../../utils/colors.dart';


class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final IconData? suffixIcon;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function()? onSuffixIconTap;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextInputType? keyboardType;
  const CustomTextFormField(
      {super.key,
      this.hintText,
      this.icon,
      this.suffixIcon,
      this.onSuffixIconTap,
      this.focusNode,
      this.controller,
      this.validator,
      this.onSaved,
      this.onTapOutside,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder kOutlineInputBorder(Color color) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 1,
            color: color,
          ),
        );
    return TextFormField(
      style: const TextStyle(
        color: ColorPicker.primaryDarkColor,
      ),
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      focusNode: focusNode,
      onTapOutside: onTapOutside,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: ColorPicker.primaryDarkColor,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          size: 18,
          color: ColorPicker.primaryDarkColor,
        ),
        suffixIcon: InkWell(
          onTap: onSuffixIconTap,
          child: Icon(
            suffixIcon,
            size: 22,
            color: ColorPicker.primaryDarkColor,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: ColorPicker.primaryDarkColor,
        ),
        fillColor: ColorPicker.backgroundColor,
        filled: true,
        errorStyle: const TextStyle(
          color: ColorPicker.errorColor,
        ),
        enabledBorder: kOutlineInputBorder(ColorPicker.primaryColor),
        focusedBorder: kOutlineInputBorder(ColorPicker.primaryColor),
        errorBorder: kOutlineInputBorder(ColorPicker.errorColor),
        focusedErrorBorder: kOutlineInputBorder(ColorPicker.errorColor),
      ),
    );
  }
}
