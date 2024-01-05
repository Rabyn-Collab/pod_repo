import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/models/comment_data.dart';

import '../models/news.dart';




class ApiService{

 static final _dio = Dio();
  static Future<List<News>> getSearchNews({required String query}) async{
    try{
      final response = await _dio.get('https://newsapi.org/v2/everything',
          queryParameters: {
         'apiKey': '6755b948d1064281a661e72a262ccc2d',
          'q': query
      });
      return (response.data['articles'] as List).map((e) => News.fromJson(e)).toList();
    }on DioException catch (err){
        throw '${err.message}';
    }
  }


 static Future<List<CommentData>> getComments() async{
   try{
     final response = await _dio.get('https://dummyjson.com/comments');
     return (response.data['comments'] as List).map((e) => CommentData.fromJson(e)).toList();
   }on DioException catch (err){
     throw '${err.message}';
   }
 }

}

final commentProvider = FutureProvider((ref) => ApiService.getComments());