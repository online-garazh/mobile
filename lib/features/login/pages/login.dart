import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/custom_text_field.dart';
import 'package:mobile/features/login/provider/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    _emailController.text = '4kuper@gmail.com';
    _passworController.text = 'Qwerty1234!';
    super.initState();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passworController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LoginProvider loginProvider = context.read<LoginProvider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 160),
              SvgPicture.asset(
                'assets/images/logo/logo.svg',
                height: 100,
              ),
              const SizedBox(height: 120),
              const Text(
                'Увійдіть',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _emailController,
                errorText: '',
                hintText: '',
                title: 'Електронна пошта *',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: _passworController,
                errorText: '',
                hintText: '',
                title: 'Пароль*',
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                height: 50,
                elevation: 1,
                splashColor: Colors.black,
                color: Colors.black,
                textColor: Colors.white,
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  await loginProvider
                      .login(email: _emailController.text, password: _passworController.text)
                      .onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(child: Text(loginProvider.errorMessage ?? '')),
                        backgroundColor: Colors.red.shade300,
                      ),
                    );
                  }).then(
                    (value) => context.go('/'),
                  );
                },
                child: const Text(
                  'Увійти',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 5),
              ElevatedButton(onPressed: () {}, child: const Text('123')),
              ElevatedButton(onPressed: () {}, child: const Text('123213')),
            ],
          ),
        ),
      ),
    );
  }
}
