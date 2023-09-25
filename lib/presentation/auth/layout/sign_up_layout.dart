import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/data/blocs/auth_bloc/auth_bloc.dart';
import 'package:learning_app/routes/routes_constant.dart';
import 'package:learning_app/utils/colors.dart';
import 'package:learning_app/utils/constant.dart';
import 'package:learning_app/utils/validator.dart';

import '../modules/auth_button.dart';
import '../modules/custom_text_field.dart';

class SignUpLayout extends StatefulWidget {
  const SignUpLayout({super.key});

  @override
  State<SignUpLayout> createState() => _SignUpLayoutState();
}

class _SignUpLayoutState extends State<SignUpLayout> {
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Validator validator = Validator();

  @override
  void dispose() {
    fullNameController.clear();
    emailController.clear();
    phoneNoController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is SignUpLoadedState) {
                    switch (state.signUpStatus) {
                      case SignUpStatus.pending:
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: ColorPicker.primaryColor,
                                content: Text('Loading...')));
                      case SignUpStatus.exists:
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: ColorPicker.errorColor,
                                content: Text('User already exists')));
                      case SignUpStatus.failed:
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: ColorPicker.errorColor,
                                content: Text('Sign up failed')));
                      case SignUpStatus.successful:
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: ColorPicker.primaryColor,
                                content: Text('Sign up successful')));
                        Navigator.of(context)
                            .pushReplacementNamed(RouteConstant.learningHome);
                    }
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: signUpFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                          hintText: 'Full Name',
                          controller: fullNameController,
                          icon: Icons.person,
                          keyboardType: TextInputType.name,
                          validator: (value) => validator.nameValidator(value!),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                          hintText: 'Email',
                          icon: Icons.email,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              validator.emailValidator(value!),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                          hintText: '+91 Phone Number',
                          icon: Icons.phone,
                          controller: phoneNoController,
                          keyboardType: TextInputType.phone,
                          validator: (value) =>
                              validator.phoneNoValidator(value!),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                          hintText: 'Password',
                          icon: Icons.lock,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) =>
                              validator.passwordValidator(value!),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                          hintText: 'Confirm Password',
                          icon: Icons.lock,
                          controller: confirmPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) =>
                              validator.confirmPasswordValidator(
                                  value!, passwordController.text.trim()),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(RouteConstant.login);
                              },
                              child: const Text(
                                'Already have an account? Login',
                                style: TextStyle(
                                  color: ColorPicker.primaryDarkColor,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        AuthButton(
                          buttonText: 'sign up',
                          onPressed: () async {
                            if (signUpFormKey.currentState!.validate()) {
                              signUpFormKey.currentState!.save();
                              context.read<AuthBloc>().add(SignUpLoadedEvent(
                                  fullNameController.text.trim(),
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                  phoneNoController.text.trim()));
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
