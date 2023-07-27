import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({required this.goException, super.key});

  final GoException? goException;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(goException?.message ?? 'error')),
    );
  }
}
