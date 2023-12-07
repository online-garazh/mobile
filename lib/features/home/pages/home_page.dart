import 'package:flutter/material.dart';
import 'package:mobile/components/custom_text_button.dart';
import 'package:mobile/components/spacers.dart';
import 'package:mobile/features/login/pages/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextButton(
            text: 'Move to Login',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          Space.spaceH19
        ],
      ),
    );
  }
}
