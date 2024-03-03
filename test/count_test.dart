import 'package:flutter_test/flutter_test.dart';
import 'package:shopy/test_sample/count.dart';



void main (){

  late Count counter;
///setUp >> test >> setUp >> test >> setUp >> test
setUp((){
  counter = Count();
});

///setUpAll >> test >>  >> test >> test
setUpAll(() => null);

  group('count-test', () {
    test('in count class value should be 0 when instantiate', () {
     final  val = counter.itCount;
      expect(val, 0);
    });

    test('when add val be 1', () {
       counter.increIt();
       final  val = counter.itCount;
      expect(val, 1);
    });

    test('if minus val be -1', () {

      counter.decreIt();
      final  val = counter.itCount;
      expect(val, -1);
    });


  });

  /// test >> tearDown >> test >> tearDown >> test >> tearDown
  tearDown(() => null);

/// test >> test >> test >>  tearDown
  tearDownAll(() => null);

}