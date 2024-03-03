import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_model.g.dart';

part 'test_model.freezed.dart';

@freezed
class TestModel with _$TestModel {

  const factory TestModel({
    required String desc,  
    required bool completed,
    required String id
}) = _TestModel;

  factory TestModel.fromJson(Map<String, dynamic> json) =>
      _$TestModelFromJson(json);
}
