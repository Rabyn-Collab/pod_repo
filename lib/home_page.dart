import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/todo.dart';
import 'package:podsriver/todo_provider.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    ref.listen(todoProvider, (previous, next) {
      if(next.hasError && !next.isLoading){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${next.error}'))
        );
      }
    });

    final  todos = ref.watch(todoProvider);



       print('isLoading :${todos.isLoading}');
       print('isReloading :${todos.isReloading}');
       print('hasValue :${todos.hasValue}');
       print('hasError :${todos.hasError}');
       print('value :${todos.value}');
       print('error :${todos.error}');
  print(('=================================================================='));

    return Scaffold(
      body:  todos.when(
         skipLoadingOnReload: true,
          skipError: true,
          data: (data){
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index){
                        return SwitchListTile(
                            value: data[index].completed,
                            onChanged: (val){
                              ref.read(todoProvider.notifier).updateData(todoData: TodoData(
                                  id: data[index].id, completed: val, description: data[index].description));
                            },
                          title: Text(data[index].description),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(onPressed: (){
                    ref.read(todoProvider.notifier).ErrorData();
                  }, child: todos.isReloading ? Center(child: CircularProgressIndicator()): Text('Retry')),
                ),
              ],
            );
          },
          error: (err, st) => Center(child: Text('$err')),
          loading: () => Center(child: CircularProgressIndicator())
      )
    );
  }
}