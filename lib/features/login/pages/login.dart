import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobile/components/custom_material_button.dart';
import 'package:mobile/components/custom_text_button.dart';
import 'package:mobile/components/custom_text_field.dart';
import 'package:mobile/theme/custom_text_style.dart';

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
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Увійти',
                textAlign: TextAlign.center,
                style: AppPallete.font30w700,
              ),
              const SizedBox(
                height: 40,
              ),
              const _FormLogin(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextButton(
                      title: 'Реєстрація',
                      onPressed: () {
                        log('Registration');
                      }),
                  CustomTextButton(
                      title: 'Забули пароль?',
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
            fillColor: Colors.white,
            cursorColor: Colors.black54,
            cursorWidth: 2,
          ),
          CustomTextField(
            hintText: 'Пароль*',
            errorText: 'Enter valid password',
            isPassword: true,
            height: 100,
            controller: _passwordController,
            fillColor: Colors.white,
            cursorColor: Colors.black54,
            cursorWidth: 2,
          ),
          CustomMaterialButton(
            height: 60,
            title: 'Увійти',
            color: Colors.black,
            textTheme: AppPallete.font18w600.copyWith(color: Colors.white),
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
