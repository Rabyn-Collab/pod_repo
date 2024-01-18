import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/todo.dart';
import 'package:dio/dio.dart';


final todoProvider = AsyncNotifierProvider(() => TodoProvider());

class TodoProvider extends AsyncNotifier{
final dio = Dio();
  @override
  FutureOr<List<TodoData>> build() async {
      final response = await dio.get('https://6538d9e7a543859d1bb20d51.mockapi.io/todos');
      return (response.data as List).map((e) => TodoData.fromJson(e)).toList();
  }


FutureOr<void> updateData({required TodoData todoData}) async {
  state = const AsyncLoading();
   try{
     final response = await dio.patch('https://6538d9e7a543859d1bb20d51.mockapi.io/todos/${todoData.id}', data: {
       'completed': todoData.completed
     });
     state = AsyncData([
       for(final todo in state.value!) todo.id == todoData.id ? todoData : todo
     ]);
   }catch (err){

   }


}


FutureOr<void> ErrorData() async {
  state = const AsyncLoading();
  try{
    final response = await dio.patch('https://6538d9e7a543859d1bb20d51.mockapi.io/todos/900', data: {
      'completed': true
    });

  }catch (err, st){
   state = AsyncError('Error occurred', st);
  }


}



}