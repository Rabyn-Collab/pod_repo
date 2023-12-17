import 'package:dio/dio.dart';
import 'package:podsriver/constants/api.dart';
import 'package:podsriver/models/movie.dart';
import 'package:podsriver/models/video.dart';



class MovieService {

 static final dio = Dio(BaseOptions(
     headers: {
       'Authorization': Api.apiKey
     }
 ));

  static Future<List<Movie>> getMovie({required String apiPath}) async {
    try {
      final response = await dio.get(apiPath);
      return (response.data['results'] as List).map((e) => Movie.formJson(e) ).toList();
    } on DioException catch (err) {
      throw '${err.message}';
    }
  }


 static Future<List<Video>> getVideo({required int id}) async {
   try {
     final response = await dio.get('${Api.baseUrl}/movie/$id/videos');
     print(response.data);
     return (response.data['results'] as List).map((e) => Video.fromJson(e) ).toList();
   } on DioException catch (err) {
     throw '${err.message}';
   }
 }



}


