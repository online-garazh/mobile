import 'package:flutter/material.dart';
import 'package:mobile/components/custom_app_bar.dart';
import 'package:mobile/components/custom_icon_button.dart';
import 'package:mobile/components/custom_text_button.dart';
import 'package:mobile/components/spacers.dart';
import 'package:mobile/features/login/pages/login.dart';
import 'package:mobile/features/profile/pages/profile_page.dart';
import 'package:mobile/theme/custom_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('HomePage'),
        actions: [
          CustomIconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            icon: Icons.person,
            color: AppPalette.black,
          )
        ],
      ),
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
