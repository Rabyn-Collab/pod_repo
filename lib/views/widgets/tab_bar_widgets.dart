


import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:podsriver/models/movie.dart';
import 'package:podsriver/provider/pagination_provider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:podsriver/views/detail_page.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';


class TabBarWidgets extends StatelessWidget {
  final String api;
  const TabBarWidgets({super.key, required this.api});

  @override
  Widget build(BuildContext context) {

    return OfflineBuilder(
      child: Container(),
      connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child) {
        final bool connected = connectivity != ConnectivityResult.none;
        return RiverPagedBuilder<int, Movie>(
          firstPageKey: 1,
          provider: pageProvider(api),
          itemBuilder: (context, item, index) => InkWell(
              onTap: (){
                Get.to(() => DetailPage(movie: item), transition: Transition.leftToRight);
              },
              child: Image.network(item.poster_path)),
          pagedBuilder: (controller, builder) =>
              PagedGridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 2/3
                  ),
                  pagingController: controller, builderDelegate: builder),
        );
      }
    );
  }
}
