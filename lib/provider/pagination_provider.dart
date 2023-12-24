



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/api_service/movie_service.dart';
import 'package:podsriver/constants/api.dart';
import 'package:podsriver/models/movie.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class A {
  final int a;
  A({required this.a});
}

class B extends A{
  B(): super(a: 90);
}

final v = B();


class MoviePageNotifier extends PagedNotifier<int, Movie> {


  final String apiPath;
  MoviePageNotifier({
  required this.apiPath
  }):super(
        load: (page, limit) => MovieService.getMovie(
            apiPath: apiPath,
          page: page
        ),
        nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
      );

}


final  pageProvider =
StateNotifierProvider.family<MoviePageNotifier,
    PagedState<int, Movie>, String>((_, String apiPath) => MoviePageNotifier(apiPath: apiPath));