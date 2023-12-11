import 'package:dio/dio.dart';
import 'package:podsriver/constants/api.dart';
import 'package:podsriver/models/movie.dart';



class MovieService {
 static final dio = Dio();
  static Future<List<Movie>> getMovie() async {
    try {
      final response = await dio.get(Api.popularMovie,
      options: Options(
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MmMxZTMzZjAxNTc1NWQyN2EyMzE3OTNjNDRlY2ZlZCIsInN1YiI6IjY0MjI1ODg5MjNiZTQ2MDBmZWJlZDRjNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lT1CZd154FGl1Cofz9vNlfsiiBvu0uRJZLok7tv-7II'
        }
      )
      );
      return (response.data['results'] as List).map((e) => Movie.formJson(e) ).toList();
    } on DioException catch (err) {
      throw '${err.message}';
    }
  }
}

// class Bank{
//  static final bankName = 'as;ldksda;l';
//
//   void add(){
//     print('as;dlkdsl');
//   }
// }
