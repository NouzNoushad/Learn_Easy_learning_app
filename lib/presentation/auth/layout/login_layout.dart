import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/data/blocs/auth_bloc/auth_bloc.dart';
import 'package:learning_app/routes/routes_constant.dart';
import 'package:learning_app/utils/colors.dart';
import 'package:learning_app/utils/constant.dart';
import 'package:learning_app/utils/validator.dart';

import '../modules/auth_button.dart';
import '../modules/custom_text_field.dart';

class LoginLayout extends StatefulWidget {
  const LoginLayout({super.key});

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Validator validator = Validator();
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
                listener: (context, state){
                  if (state is LoginLoadedState) {
                    switch (state.loginStatus) {
                      case LoginStatus.pending:
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: ColorPicker.primaryColor,
                                content: Text('Loading...')));
                      case LoginStatus.wrongPassword:
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: ColorPicker.errorColor,
                                content: Text('Invalid credential')));
                      case LoginStatus.noUser:
                      ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: ColorPicker.errorColor,
                                content: Text('Invalid user')));
                      case LoginStatus.exists:
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: ColorPicker.errorColor,
                                content: Text('User already exists')));
                      case LoginStatus.failed:
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: ColorPicker.errorColor,
                                content: Text('Login failed')));
                      case LoginStatus.successful:
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: ColorPicker.primaryColor,
                                content: Text('Login successful')));
                        Navigator.of(context)
                            .pushReplacementNamed(RouteConstant.learningHome);
                    }
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                          hintText: 'Password',
                          icon: Icons.lock,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) =>
                              validator.passwordValidator(value!),
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
                                    .pushReplacementNamed(RouteConstant.signUp);
                              },
                              child: const Text(
                                "Don't have an account? Sign up",
                                style: TextStyle(
                                  color: ColorPicker.primaryDarkColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        AuthButton(
                          buttonText: 'login',
                          onPressed: () async {
                            if (loginFormKey.currentState!.validate()) {
                              loginFormKey.currentState!.save();
                              context.read<AuthBloc>().add(LoginLoadedEvent(
                                  emailController.text.trim(),
                                  passwordController.text.trim()));
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
