import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/provider/food_provider.dart';


class DetailPage extends ConsumerWidget {
  final String mealCata;
  const DetailPage({super.key, required this.mealCata});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(categoryItemProvider(mealCata));

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
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(food.strMeal),
                                Image.network(food.strMealThumb),
                              ],
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
