import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/constants/app_sizes.dart';
import 'package:podsriver/models/note.dart';
import 'package:podsriver/provider/riverpod_providers.dart';



class HomePage extends StatelessWidget {
   HomePage({super.key});

   final textControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: Text('Note App'),
      ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer(
            builder: (context, ref, child) {
              final notes = ref.watch(todoProvider);

              return Column(
                children: [
                  AppSizes.gapH12,
                  TextFormField(
                    controller: textControl,

                    onFieldSubmitted: (val) {

                      final note = Note(
                          title: val.trim(),
                          createdAt: DateTime.now().toString()
                      );
                       ref.read(todoProvider.notifier).noteAdd(note);
                       textControl.clear();
                    },
                    decoration: InputDecoration(
                        hintText: 'Add some',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.today)
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: notes.length,
                          itemBuilder: (context, index){
                            final note = notes[index];
                            return ListTile(
                              title: Text(note.title),
                              subtitle: Text(note.createdAt),
                              trailing: Container(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      IconButton(onPressed: (){}, icon:Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: (){
                                            showDialog(context: context, builder: (context){
                                              return AlertDialog(
                                                title: Text('Hold ON'),
                                                content: Text('Are You sure ?'),
                                                actions: [
                                                  TextButton(onPressed: (){
                                                    Navigator.pop(context);
                                                    ref.read(todoProvider.notifier).noteRemove(note);
                                                  }, child: Text('Yes')),
                                                  TextButton(onPressed: (){
                                                    Navigator.pop(context);
                                                  }, child: Text('No')),
                                                ],
                                              );
                                            });
                                          }, icon:Icon(Icons.delete)),
                                    ],
                                  )),
                            );
                          })
                  )
                ],
              );
            }
          ),
        )
    );
  }
}
