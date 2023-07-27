import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/app.dart';
import 'package:mobile/core/network/rest_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void main() {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://p01--nginx--y2rj87zmcyys.code.run/api/'))
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    );

  GetIt.I.registerSingleton<AbstractRestClient>(RestClient(dio: dio));

  runZonedGuarded(() => runApp(const App()), (error, stack) {
    log(error.toString());
  });
}
