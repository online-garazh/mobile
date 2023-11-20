import 'package:flutter/material.dart';
import 'package:mobile/components/custom_material_button.dart';
import 'package:mobile/components/custom_text_button.dart';
import 'package:mobile/components/custom_text_field.dart';
import 'package:mobile/features/login/pages/success_screen.dart';

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
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 40,
              ),
              const _FormLogin(),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextButton(
                      content: 'Реєстрація',
                      onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SuccessScreen(),
                            ),
                          )),
                  CustomTextButton(
                    content: 'Забули пароль?',
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SuccessScreen(),
                      ),
                    ),
                  ),
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
            hintText: 'Електронна пошта*',
            height: 55,
            controller: _emailController,
          ),
          CustomTextField(
            hintText: 'Пароль*',
            isPassword: true,
            height: 55,
            controller: _passwordController,
          ),
          CustomMaterialButton(
            height: 55,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SuccessScreen(),
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
