
import 'package:buzz_chat/models/Message.dart';
import 'package:flutter/cupertino.dart';

import '../../models/Guest.dart';
import '../../models/Users.dart';

@immutable
class MessageEvents {}


class SendMessageRequested extends MessageEvents {
   final String message;
   final String curUId;
   final String ranUId;
   final String chatRoomId;
   final Users? randomJoinedUsers;
   final Guest? randomJoinedGuests;
   SendMessageRequested({
     this.randomJoinedUsers,
      this.randomJoinedGuests,
     required this.message,
     required this.curUId, required this.ranUId, required this.chatRoomId,
   });
}

class GetMessagesRequested extends MessageEvents {
   final String userUid;
   final String messageUid;
   final String receiverId;
   final String chatRoomId;
   GetMessagesRequested({
     required this.userUid,
     required this.messageUid,
     required this.receiverId,
     required this.chatRoomId,
   });
}

class UpdateMessageSeen extends MessageEvents {
  final String userUid;
  final Message message;
  UpdateMessageSeen({required this.message,required this.userUid});
}

class UpdateUserTypingStatus extends MessageEvents {
   final String userUid;
   final Message message;
   final bool isTyping;
   UpdateUserTypingStatus({required this.message,required this.userUid,required this.isTyping,});
}

class GetChatroomIdsRequest extends MessageEvents {
   final String chatroomId;
   final String ranUserId;
   final String currUserId;
   GetChatroomIdsRequest({required this.chatroomId,required this.currUserId,required this.ranUserId});
}

class DeleteChatRoomRequest extends MessageEvents {
  final String chatRoomID;
  DeleteChatRoomRequest({required this.chatRoomID});
}

class SaveChatsRequest extends MessageEvents {
  final String chatRoomID;
  SaveChatsRequest({required this.chatRoomID});
}

