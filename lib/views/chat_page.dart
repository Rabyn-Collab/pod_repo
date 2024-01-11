import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:podsriver/provider/room_provider.dart';



class ChatPage extends ConsumerStatefulWidget {
  final types.Room room;
  final String token;
  final String currentName;
  const ChatPage({super.key, required this.room, required this.token, required this.currentName});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    final msgStream = ref.watch(messageStream(widget.room));
    return Scaffold(
        body: SafeArea(
            child: SafeArea(
                child: msgStream.when(
                    data: (data){
                      return Chat(
                        showUserAvatars: true,
                        showUserNames: true,
                        isAttachmentUploading: isLoad,
                        messages: data,
                        onAttachmentPressed: () {
                          setState(() {
                            isLoad = true;
                          });
                          final picker = ImagePicker();
                          picker.pickImage(source: ImageSource.gallery).then((value) async{
                               if(value != null) {
                                 //print(File(value.path).lengthSync()/1024/1024);
                                 final ref = FirebaseStorage.instance.ref().child('chatImage/${value.name}');
                                 await ref.putFile(File(value.path));
                                 final url = await ref.getDownloadURL();
                                 final message = types.PartialImage(
                                   name: value.name,
                                   size: File(value.path).lengthSync(),
                                   uri: url,
                                 );
                                 FirebaseChatCore.instance.sendMessage(
                                     message,
                                     widget.room.id);
                                 setState(() {
                                   isLoad = false;
                                 });
                               }
                          });
                        },
                        onSendPressed: (val) async{
                          final dio = Dio();
                          FirebaseChatCore.instance.sendMessage(val, widget.room.id);
                          try{
                            await dio.post('https://fcm.googleapis.com/fcm/send', data: {
                              "to": "cyzUmtpsRPKvQxr_IFyMHo:APA91bFkPI3BgX8UBWtUx0lgZ_EoNBGHxSHKRBQTlk-smJmXU5oLSkiFmf31osxFnwHlN66Kyrh7exg20n432rlyPIETvOi75mfCr7PCCbBH29NrIVKH9teY27EjgspML8xqhfVxuEzP",
                              "priority": "High",
                              "default_notification_channel_id": "high_importance_channel",
                              "notification":{
                                "body": val.text.trim(),
                                "title":"wow a notify"
                              },

                            }, options: Options(
                              headers:  {
                                'Authorization': 'key=AAAAMx9eYIM:APA91bFKYWRg3zHUWacpFKJsjNbOInmGs-u3TeEHNnADh68xBJATj28MNKxyZCt5NkALnAuJDXcBb2d6gSqJ5xpe4Wq8nhFHGbaj-oFE-PvOOvy9TWPS0zOlW_e9Hd-05LQH9fD60-kX'
                            }
                            ));
                          }catch(err){

                          }

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
