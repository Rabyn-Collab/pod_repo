import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/service/api_service.dart';





final mealProvider = FutureProvider((ref) => ApiService.getData());


