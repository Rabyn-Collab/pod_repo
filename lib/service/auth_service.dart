import 'package:dio/dio.dart';
import 'package:podsriver/api.dart';

class AuthService {
  static final _dio = Dio();

  static Future userLogin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(Api.userLogin);
    } on DioException catch (err) {
      throw '${err.response}';
    }
  }

}