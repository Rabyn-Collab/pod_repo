

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopy/test_sample/api_repository.dart';
import 'package:shopy/test_sample/test_model.dart';


class MockHTTPClient extends Mock implements Client {}

void main() {
  late ApiRepository apiRepository;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    apiRepository = ApiRepository(mockHTTPClient);
  });

  // group('some test', () {
  //     test('getData', () async {
  //       final user =  await ApiRepository().getData();
  //       expect(user, 900);
  //     });
  // });

  group('ApiRepository - ', () {

      test('getData', () async{
            when(
                  () => mockHTTPClient.get(
                Uri.parse('https://6538d9e7a543859d1bb20d51.mockapi.io/todos/3'),
              ),
            ).thenAnswer((invocation) async {
              return Response('''
              {
               "desc": "oiuoiuoiuoi",
               "completed": false,
               "id": "9"
              }
              ''', 200);
            });
        final user = await apiRepository.getData();
        expect(user, isA<TestModel>());
        // expect(user, throwsException);
       // expect(user, isA<TestModel>());
       //expect(user, TestModel(desc: '', completed: false, id: 90));
      });



  });
}

