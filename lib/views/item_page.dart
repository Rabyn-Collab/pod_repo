import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:podsriver/common_widgets/error_widget.dart';
import 'package:podsriver/common_widgets/loading_widget.dart';
import 'package:podsriver/provider/meal_provider.dart';
import 'package:podsriver/views/item_detail.dart';



class ItemPage extends ConsumerWidget{
  final String label;
  const ItemPage({super.key, required this.label});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(itemProvider(label));

    return Scaffold(
        body:  SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: state.when(
                data: (data){
                  return GridView.builder(
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        mainAxisExtent: 250,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10
                      ),
                      itemBuilder: (context, index){
                        final item = data[index];
                        return InkWell(
                          onTap: (){
                         Get.to(() => ItemDetail(id: item.idMeal), transition: Transition.leftToRight);
                          },
                          child: Column(
                            children: [
                              Text(item.strMeal),
                              Image.network(item.strMealThumb),
                            ],
                          ),
                        );
                      }
                  );
                },
                error: (err, st){
                  return ErrorUi(message: '$err');
                },
                loading: () => LoadingWidget()
            ),
          ),
        )
    );
  }
}
