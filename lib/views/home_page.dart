import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:podsriver/common_widgets/error_widget.dart';
import 'package:podsriver/common_widgets/loading_widget.dart';
import 'package:podsriver/provider/meal_provider.dart';
import 'package:podsriver/views/item_page.dart';



class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(mealProvider);

    return Scaffold(
      appBar: AppBar(),
        body: state.when(
            data: (data){
              return GridView.builder(
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                  ),
                  itemBuilder: (context, index){
                    final cata = data[index];
                    return InkWell(
                      onTap: (){
                        Get.to(() => ItemPage(label: cata.strCategory), transition: Transition.leftToRight);
                      },
                      child: Column(
                        children: [
                          Text(cata.strCategory),
                          Image.network(cata.strCategoryThumb),
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
        )
    );
  }
}
