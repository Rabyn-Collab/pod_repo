import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/provider/room_provider.dart';


class RecentChats extends ConsumerWidget{
  const RecentChats({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(roomsStream);
    return Scaffold(
        body: SafeArea(
            child: state.when(data: (data){
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index){
                    final room = data[index];
                    return ListTile(
                       leading: CircleAvatar(
                         backgroundImage: NetworkImage(room.imageUrl!),
                       ),
                      title: Text(room.name!),
                    );
                  }
              );
            }, error: (err, st){
              return Center(child: Text('$err'));
            }, loading: () => Center(child: CircularProgressIndicator())
            )
        )
    );
  }
}
