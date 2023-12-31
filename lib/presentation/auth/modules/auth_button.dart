import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const AuthButton({super.key, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.075,
      width: MediaQuery.of(context).size.width * 0.4,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ColorPicker.primaryColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                      width: 1.5, color: ColorPicker.primaryColor)))),
          child: Text(
            buttonText.toUpperCase(),
            style: const TextStyle(
                fontSize: 16,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                color: ColorPicker.primaryDarkColor),
          )),
    );
  }
}
