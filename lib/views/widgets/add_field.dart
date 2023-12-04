import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/models/note.dart';
import 'package:podsriver/provider/riverpod_providers.dart';



class AddField extends StatelessWidget {
  final WidgetRef ref;
   AddField({super.key, required this.ref});
  final textControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
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
    );
  }
}
