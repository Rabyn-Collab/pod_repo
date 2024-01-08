import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:podsriver/api_service/room_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;


part 'room_provider.g.dart';

final roomsStream = StreamProvider((ref) => FirebaseChatCore.instance.rooms());
final messageStream = StreamProvider.family((ref, types.Room room) => FirebaseChatCore.instance.messages(room));

@riverpod
class RoomNotify extends _$RoomNotify {
  @override
  FutureOr build() async {

  }

    Future<void> roomCreate({
    required types.User user,
  }) async{
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() => RoomService.roomCreate(user: user));
  }


}
