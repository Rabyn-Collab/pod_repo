import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/api_service/movie_service.dart';






final videoProvider = FutureProvider.family(
        (ref, int id) => MovieService.getVideo(id: id));