import 'package:dio/dio.dart';
import 'package:mobile/core/errors/error_handler.dart';
import 'package:mobile/core/models/request/login_request.dart';
import 'package:mobile/core/models/request/signup_request.dart';
import 'package:mobile/core/models/response/login_response.dart';

abstract class AbstractRestClient {
  Future<AccessToken?> login({required LoginRequestModel loginData});

  Future<bool> signup({required RegisterUser signupData});

  Future<bool> verifyNicknameAvailability({required String nickName});
}

class RestClient implements AbstractRestClient {
  final Dio dio;

  final String _loginUrl = '/auth/login';
  final String _signup = '/auth/signup';
  final String _verifyNickNameAvailabilite = '/users/verifyNicknameAvailability';

  RestClient({required this.dio});

  @override
  Future<AccessToken?> login({required LoginRequestModel loginData}) async {
    try {
      final response = await dio.post(_loginUrl, data: loginData.toJson());
      return AccessToken.fromJson(response.data);
    } catch (e) {
      ErrorHandler.errorHelper(e);
      rethrow;
    }
  }

  @override
  Future<bool> signup({required RegisterUser signupData}) async {
    try {
      await dio.post(_signup, data: signupData.toJson());
      return true;
    } catch (e) {
      ErrorHandler.errorHelper(e);
      return false;
    }
  }

  @override
  Future<bool> verifyNicknameAvailability({required String nickName}) async {
    try {
      await dio.post(_verifyNickNameAvailabilite, data: <String, dynamic>{"nickName": nickName});
      return true;
    } catch (e) {
      ErrorHandler.errorHelper(e);
      return false;
    }
  }
}
