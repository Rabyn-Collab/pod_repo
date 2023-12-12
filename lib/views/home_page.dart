import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:podsriver/provider/food_provider.dart';
import 'package:podsriver/provider/movie_provider.dart';
import 'package:podsriver/views/detail_page.dart';



class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(categoryProvider);

    return Scaffold(
        body: SafeArea(
          child: state.when(
              data: (data){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                         mainAxisExtent: 200
                      ),
                      itemBuilder: (context, index){
                      final food = data[index];
                        return InkWell(
                          onTap: (){
                            Get.to(() => DetailPage(mealCata: food.strCategory), transition: Transition.leftToRight);
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(food.strCategory),
                                  Image.network(food.strCategoryThumb),
                                  Text(food.strCategoryDescription, maxLines: 3,),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                );
              },
              error: (err, st){
                return Center(child: Text('$err'));
              },
              loading: (){
                return Center(child: CircularProgressIndicator());
              }
          ),
        )
    );
  }
}
