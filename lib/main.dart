import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile/app.dart';

void main() {
  runZonedGuarded(
    () => runApp(const App()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
