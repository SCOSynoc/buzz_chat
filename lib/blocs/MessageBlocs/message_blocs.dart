

import 'package:buzz_chat/blocs/MessageBlocs/message_states.dart';
import 'package:buzz_chat/models/Message.dart';
import 'package:buzz_chat/repository/message_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'message_events.dart';

class MessageBlocs extends Bloc<MessageEvents,MessageStates> {
   MessageBlocs(): super(MessageInitial()) {
     on<SendMessageRequested>(_sendMessageRequested);
     on<UpdateMessageSeen>(_updateMessageSeenRequested);
     on<UpdateUserTypingStatus>(_updateUserTypingStatusRequest);
     on<GetMessagesRequested>(_onGetMessageRequest);
     on<GetChatroomIdsRequest>(_getChatroomCredentials);
     on<DeleteChatRoomRequest>(_onDeleteChat);
     on<SaveChatsRequest>(_onSaveChatsReq);
   }

   MessageService msgService = MessageService()..initializeInstances();

   void _sendMessageRequested(SendMessageRequested event, Emitter<MessageStates> emit) async{

       /* await msgService.sendAndAddMessageToDatabase(randomUser: event.randomJoinedUsers,
            randomGuest: event.randomJoinedGuests, message: event.message);*/
     Message messageData = Message(message:event.message, senderId: event.curUId,
         receiverId: event.ranUId, messageType: "text", isSeen: false, msgUid: DateTime.now().toIso8601String(), isTyping: false, isMe: false,
         timeSent: DateTime.now());
         await msgService.sendMessage(chatRoomId: event.chatRoomId, message: messageData);
   }

   void _updateMessageSeenRequested(UpdateMessageSeen event, Emitter<MessageStates> emit){

   }

   void _updateUserTypingStatusRequest(UpdateUserTypingStatus event, Emitter<MessageStates> emit){

   }
   
   void _onGetMessageRequest(GetMessagesRequested event, Emitter<MessageStates> emit) async {
      Stream<List<Message>> msgLists = msgService.messagesStream(chatRoomId: event.chatRoomId, );

      if(await msgLists.isEmpty) {

      }else{
        emit(MessageReceivedSuccess(msgList: msgLists));
      }
   }

   void _getChatroomCredentials(GetChatroomIdsRequest event, Emitter<MessageStates> emit) {
         emit(ChatroomIdsReceived(ranUserId: event.ranUserId, currUserId: event.currUserId, chatroomId: event.chatroomId));
   }


   void _onDeleteChat(DeleteChatRoomRequest event, Emitter<MessageStates> emit) async{
       bool deleted = await msgService.deleteChatRoom(chatroomID: event.chatRoomID);
       if(deleted) {
         emit(ChatRoomDeleteSuccess());
       }

   }

   void _onSaveChatsReq(SaveChatsRequest event, Emitter<MessageStates> emit) async{
     final String chatRoomID = event.chatRoomID;
     bool done = await msgService.saveChats(chatRoomId: chatRoomID);
     if(done) {
       emit(ChatsSavedSuccessfully());
     }else{
       emit(ChatsFailedToSave());
     }
   }

}

