import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/core/errors/error_handler.dart';
import 'package:mobile/core/models/request/login_request.dart';
import 'package:mobile/core/models/request/signup_request.dart';
import 'package:mobile/core/models/response/login_response.dart';
import 'package:mobile/core/network/rest_client.dart';
import 'package:mobile/local_storage/local_storage.dart';

class LoginProvider extends ChangeNotifier {
  late String authToken;
  late AccessToken? accessToken;

  String? errorMessage;

  Future<void> login({required String email, required String password}) async {
    try {
      accessToken = await GetIt.I<AbstractRestClient>()
          .login(loginData: LoginRequestModel(email: email, password: password));
      if (accessToken != null) {
        authToken = accessToken!.accessToken;
        LocalSecureStorage.write(key: AUTH_TOKEN, value: authToken);
      }
    } catch (e) {
      errorMessage = ErrorHandler.errorHelper(e);
      rethrow;
    }
  }

  Future<void> signup({required RegisterUser signupData}) async {
    try {
      await GetIt.I<AbstractRestClient>().signup(signupData: signupData);
    } catch (e) {
      errorMessage = ErrorHandler.errorHelper(e);
      rethrow;
    }
  }
}
