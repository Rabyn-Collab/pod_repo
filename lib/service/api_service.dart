import 'package:dio/dio.dart';
import 'package:podsriver/constants/api.dart';
import 'package:podsriver/models/meal.dart';


class ApiService{

   static final dio = Dio();

  static Future<List<MealCategory>> getData() async{
     try{
        final response = await dio.get(Api.mealCategory);
          return (response.data['categories'] as List).map((e) =>
              MealCategory.fromJson(e)).toList();
     }on DioException catch (err){
          throw '${err.response}';
     }

  }


   static Future<List<MealItem>> mealItem({required String meal}) async{
     try{
       final response = await dio.get('${Api.getCategoryMeal}$meal');
       return (response.data['meals'] as List).map((e) =>
           MealItem.fromJson(e)).toList();
     }on DioException catch (err){
       throw '${err.response}';
     }

   }


   static Future<Recipe> getRecipe({required String id}) async{
     try{
       final response = await dio.get('${Api.getRecipe}$id');
       return  Recipe.fromJson(response.data['meals'][0]);
     }on DioException catch (err){
       throw '${err.response}';
     }

   }


}