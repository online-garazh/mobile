import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile/features/home/pages/home_page.dart';
import 'package:mobile/features/login/pages/login.dart';
import 'package:mobile/local_storage/local_storage.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: FutureBuilder(
            future: LocalSecureStorage.read(AUTH_TOKEN),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator.adaptive();
              } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                log(snapshot.data.toString());
                return const HomePage();
              } else {
                return const LoginPage();
              }
            }),
      ),
    );
  }
}
