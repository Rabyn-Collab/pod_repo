import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopy/api.dart';
import 'package:shopy/models/userModel.dart';

class AuthService {
  static final _dio = Dio();

  static Future<UserModel> userLogin({required Map data}) async {

    try {
      final response = await _dio.post(Api.userLogin, data: data);
      final box = Hive.box('bx');
      box.put('user', response.data);
      return UserModel.fromJson(response.data);
    } on DioException catch (err) {
      throw '${err.response}';
    }on HiveError catch (err){
      throw '${err.message}';
    }
  }


  static Future userSignUp({required Map data}) async {

    try {
      final response = await _dio.post(Api.userSignUp, data: data);
    } on DioException catch (err) {

      throw '${err.response}';
    }
  }

}
