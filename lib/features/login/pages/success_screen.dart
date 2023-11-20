import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Success Screen')),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('SUCCESS'),
              SizedBox(
                height: 50,
              ),
              FlutterLogo(
                size: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
