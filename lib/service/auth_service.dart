import 'package:dio/dio.dart';
import 'package:podsriver/api.dart';

class AuthService {
  static final _dio = Dio();

  static Future userLogin({required Map data}) async {

    try {
      final response = await _dio.post(Api.userLogin, data: data);
    } on DioException catch (err) {
      throw '${err.response}';
    }
  }


  static Future userSignUp({required Map data}) async {

    try {
      final response = await _dio.post(Api.userSignUp, data: data);
    } on DioException catch (err) {
      print(err);
      throw '${err.response}';
    }
  }

}
