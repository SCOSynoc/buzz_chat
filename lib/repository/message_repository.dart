
import 'dart:convert';

import 'package:buzz_chat/repository/Local_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../models/Guest.dart';
import '../models/Message.dart';
import '../models/Users.dart';

abstract class MessageRepository {
  void initializeInstances();

  Future<void> sendAndAddMessageToDatabase({required Users? randomUser, required Guest? randomGuest, required String message});

  Stream<List<Message>> getUserMessageList({required String messageUid, required String receiverUid});

}


class MessageService extends MessageRepository {

  late FirebaseAuth _auth;
  late FirebaseFirestore _firebase;


  @override
  Stream<List<Message>> getUserMessageList({required String messageUid,required String receiverUid}) {
       return _firebase.collection('users')
           .doc(_auth.currentUser?.uid)
           .collection("chats")
           .doc(receiverUid)
           .collection('messages')
           .orderBy('timeSent',descending: true)
           .snapshots().map((event) {
             List<Message> message = [];
             for(var doc in event.docs) {
               message.add(Message.fromJson(doc.data()));
             }
             return message;
       });
  }



  @override
  void initializeInstances() {
    _auth = FirebaseAuth.instance;
    _firebase = FirebaseFirestore.instance;
  }

  @override
  Future<void> sendAndAddMessageToDatabase({required Users? randomUser, required Guest? randomGuest, required String message}) async{
    /*bool guest = randomUser == null ? true : false;

      var msgUid = const Uuid().v6();
      LocalDataService service = HiveService()..initLocalService();
      print("HERE RANDAM USER RECEIVER ID IS :: sendAndAddMessageToDatabase() and ${randomUser?.userUid}");
      Map<String,dynamic> data = jsonDecode(service.getData(key: "userData") ?? {});
      Message messageData = Message(message:message, senderId: _auth.currentUser?.uid ?? "",
          receiverId: randomUser?.userUid ?? "", messageType: "text", isSeen: false, msgUid: msgUid, isTyping: false, isMe: false,
          timeSent: DateTime.now());

      await _firebase
          .collection("users")
          .doc(_auth.currentUser?.uid)
          .collection("chats")
          .doc(messageData.receiverId).collection("messages").doc(messageData.msgUid)
          .set(messageData.toJson());

      await _firebase
          .collection("users")
          .doc( messageData.receiverId)
          .collection("chats")
          .doc(_auth.currentUser?.uid).collection("messages").doc(messageData.msgUid)
          .set(messageData.toJson());
*/
  }

  Future<void> sendMessage({required String chatRoomId, required Message message}) async {
    print("The chat room id is ${chatRoomId}");
    final mUid = const Uuid().v6();
    await _firebase.collection('chatRooms').doc(chatRoomId).collection('messages').doc(mUid).set(message.toJson());
  }

  Stream<List<Message>> messagesStream({required String chatRoomId}) {
    return _firebase.collection('chatRooms').doc(chatRoomId).collection('messages')
        .orderBy('timeSent')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Message.fromJson(doc.data())).toList().reversed.toList());
  }


  Future<bool> deleteChatRoom({ required String chatroomID })async{

    print("chatroom data ID to delete is :: $chatroomID");

    try{
      await _firebase.collection("chatRooms").doc(chatroomID).collection('messages').doc().delete();
      await _firebase.collection("chatRooms").doc(chatroomID).delete().then((v) {
        print("The data is deleted ");
      });

   return true;
    }catch(e, stack){
      if (kDebugMode) {
        print(("deleteChatRoomData():: $e and $stack"));
      }
      return false;
    }
  }

  Future<bool> saveChats({ required chatRoomId}) async {

    try {
        _firebase.collection('saveChats').doc(chatRoomId).set({"userList": [] });
        return true;
    } catch(e, stack) {
      if (kDebugMode) {
        print(("saveChats:: $e and $stack"));
      }
      return false;
    }

  }










}