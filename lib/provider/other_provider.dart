import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final loginProvider =
    NotifierProvider<LoginProvider, bool>(() => LoginProvider());

class LoginProvider extends Notifier<bool> {
  @override
  bool build() {
    return true;
  }

  void change() {
    state = !state;
  }
}

final imageProvider =
    NotifierProvider<ImageProvider, XFile?>(() => ImageProvider());

class ImageProvider extends Notifier<XFile?> {
  @override
  XFile? build() {
    return null;
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    state = await picker.pickImage(source: ImageSource.gallery);
  }
}
