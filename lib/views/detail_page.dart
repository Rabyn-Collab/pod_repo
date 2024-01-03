import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/provider/post_provider.dart';


class DetailPage extends ConsumerWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, ref) {
     final state = ref.watch(singlePostStream(id));
    return Scaffold(
        body: SafeArea(
            child: state.when(
                data: (data){
                  return Column(
                    children: [
                      Image.network(data.imageUrl),
                      Text(data.title)
                    ],
                  );
                },
                error: (err, st) => Center(child: Text('$err')),
                loading: () => Center(child: CircularProgressIndicator())
            ))
    );
  }
}
