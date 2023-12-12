import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/api_service/movie_service.dart';


final categoryProvider = FutureProvider((ref) => FoodService.getCategory());

final categoryItemProvider = FutureProvider.family(
        (ref, String category) => FoodService.getFoodItem(category: category));