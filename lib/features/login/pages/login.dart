import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobile/components/custom_material_button.dart';
import 'package:mobile/components/custom_text_button.dart';
import 'package:mobile/components/custom_text_field.dart';
import 'package:mobile/components/spacers.dart';
import 'package:mobile/theme/custom_styles.dart';

final _formKey = GlobalKey<FormState>();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const FlutterLogo(
                size: 100,
              ),
              Space.spaceH30,
              const Text(
                'Увійти',
                textAlign: TextAlign.center,
                style: AppPalette.font30w700,
              ),
              Space.spaceH40,
              const _FormLogin(),
              Space.spaceH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextButton(
                      text: 'Реєстрація',
                      onPressed: () {
                        log('Registration');
                      }),
                  CustomTextButton(
                      text: 'Забули пароль?',
                      onPressed: () {
                        log('Forgot password');
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FormLogin extends StatefulWidget {
  const _FormLogin();

  @override
  State<_FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<_FormLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            errorText: 'Enter valid email',
            hintText: 'Електронна пошта*',
            height: 100,
            isEmail: true,
            controller: _emailController,
            fillColor: AppPalette.white,
            cursorColor: AppPalette.black54,
            cursorWidth: 2,
          ),
          CustomTextField(
            hintText: 'Пароль*',
            errorText: 'Enter valid password',
            isPassword: true,
            height: 100,
            controller: _passwordController,
            fillColor: AppPalette.white,
            cursorColor: AppPalette.black54,
            cursorWidth: 2,
          ),
          CustomMaterialButton(
            height: 60,
            text: 'Увійти',
            color: AppPalette.black54,
            textStyle: AppPalette.font18w600.copyWith(color: AppPalette.white),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                log('LOGGED SUCCESSFULLY');
              }
            },
          ),
        ],
      ),
    );
  }
}
