import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'other_provider.g.dart';


@riverpod
class PickImage extends _$PickImage {
  @override
  XFile? build() {
    return null;
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    state = await picker.pickImage(source: ImageSource.gallery);
  }
}