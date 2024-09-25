import 'package:flutter/cupertino.dart';

import '../../models/Message.dart';

@immutable
class  MessageStates {}

class MessageInitial extends MessageStates {}

class MessageSendSuccess extends MessageStates {
    final bool success;
    MessageSendSuccess({required this.success});
}

class MessageSeenState extends MessageStates {
  final bool seen;
  MessageSeenState({required this.seen});
}

class MessageTypingState extends MessageStates {
  final bool typing;
  MessageTypingState({required this.typing});
}

class MessageReceivedSuccess extends MessageStates {
   final Stream<List<Message>> msgList;
   MessageReceivedSuccess({required this.msgList});
}

class ChatroomIdsReceived extends MessageStates {
  final String chatroomId;
  final String ranUserId;
  final String currUserId;

  ChatroomIdsReceived({required this.ranUserId,
    required this.currUserId,
    required this.chatroomId}
   );
}

class ChatRoomDeleteSuccess extends MessageStates {
}

class ChatsSavedSuccessfully extends MessageStates {}

class ChatsFailedToSave extends MessageStates {}

