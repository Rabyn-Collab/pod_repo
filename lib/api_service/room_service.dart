import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;




class RoomService {

  static final  _chat = FirebaseChatCore.instance;

  static  Future<void> roomCreate({
    required types.User user,
  }) async{

    try{
      await _chat.createRoom(user);
    }on FirebaseException catch(err){
      throw '${err.message}';
    }
  }




}

