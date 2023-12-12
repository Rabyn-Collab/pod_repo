import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/provider/movie_provider.dart';



class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(movieProvider);

    return Scaffold(
        body: SafeArea(
          child: state.when(
              data: (data){
                return GridView.builder(
                  itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3
                    ),
                    itemBuilder: (context, index){
                      return Text(data[index].title);
                    }
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
