import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:podsriver/api_service/post_service.dart';



final postProvider = AsyncNotifierProvider(() => PostProvider());
final postsStream = StreamProvider((ref) => PostService.getPosts());

class PostProvider extends AsyncNotifier{

  @override
  FutureOr build() {

  }

  Future<void> addPost({
    required String title,
    required String detail,
    required String userId,
    required XFile image
  }) async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => PostService.addPost(title: title, detail: detail, userId: userId, image: image));
  }

  Future<void> removePost({
    required String postId,
    required String imageId
  }) async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => PostService.removePost(postId: postId, imageId: imageId));
  }

  Future<void> updatePost({
    required String title,
    required String detail,
    required String postId,
    XFile? image,
    String? imageId
  }) async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => PostService.updatePost(
        imageId: imageId,
        image: image,
        title: title, detail: detail, postId: postId));
  }


}