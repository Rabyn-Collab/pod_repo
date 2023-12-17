import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/models/movie.dart';
import 'package:podsriver/provider/movie_provider.dart';
import 'package:podsriver/views/widgets/video_widget.dart';



class DetailPage extends ConsumerWidget {
  final Movie movie;
  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(videoProvider(movie.id));
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
             state.when(
                 data: (data){
                   return PlayVideoFromNetwork(video: data[0]);
                 },
                 error: (err, st){
                   return Center(child: Text('$err'));
                 },
                 loading: (){
                   return CircularProgressIndicator();
                 }
             )
            ],
          ),
        )
    );
  }
}
