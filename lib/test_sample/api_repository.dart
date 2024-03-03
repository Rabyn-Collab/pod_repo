
import 'dart:convert';

import 'package:http/http.dart' as http;



import 'package:shopy/test_sample/test_model.dart';

class ApiRepository{

  final http.Client client;
  ApiRepository(this.client);

   Future<TestModel> getData() async{
    try{
      final response = await client.get(Uri.parse('https://6538d9e7a543859d1bb20d51.mockapi.io/todos/3'));
      return TestModel.fromJson(jsonDecode(response.body));
    }catch (err){
      throw '${err}';
    }
  }
}