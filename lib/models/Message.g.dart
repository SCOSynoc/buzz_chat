// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      message: json['message'] as String,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      messageType: json['messageType'] as String,
      isSeen: json['isSeen'] as bool,
      msgUid: json['msgUid'] as String,
      isTyping: json['isTyping'] as bool,
      isMe: json['isMe'] as bool,
      timeSent: DateTime.parse(json['timeSent'] as String),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'messageType': instance.messageType,
      'isSeen': instance.isSeen,
      'msgUid': instance.msgUid,
      'isTyping': instance.isTyping,
      'isMe': instance.isMe,
      'timeSent': instance.timeSent.toIso8601String(),
    };
