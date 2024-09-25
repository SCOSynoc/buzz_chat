
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Message.g.dart';
part 'Message.freezed.dart';


@freezed
class Message with _$Message {
   const factory Message({
     required final String message,
     required final String senderId,
     required final String receiverId ,
     required final String messageType,
     required final bool isSeen,
     required final String msgUid,
     required final bool isTyping,
     required final bool isMe,
     required final DateTime timeSent
   }) = _Message;

   factory Message.fromJson(Map<String,dynamic> json) => _$MessageFromJson(json);
}