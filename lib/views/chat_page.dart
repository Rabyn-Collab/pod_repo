import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:podsriver/provider/room_provider.dart';



class ChatPage extends ConsumerWidget {
  final types.Room room;
  const ChatPage({super.key, required this.room});

  @override
  Widget build(BuildContext context, ref) {
    final msgStream = ref.watch(messageStream(room));
    return Scaffold(
        body: SafeArea(
            child: SafeArea(
                child: msgStream.when(
                    data: (data){
                      return Chat(
                        showUserAvatars: true,
                        showUserNames: true,
                        messages: data,
                        onSendPressed: (val){
                          FirebaseChatCore.instance.sendMessage(val, room.id);
                        },
                        user: types.User(
                            id: FirebaseAuth.instance.currentUser!.uid
                        ),
                      );
                    },
                    error: (err, st) => Center(child: Text('$err')),
                    loading: () => Center(child: CircularProgressIndicator())
                )
            ))
    );
  }
}
