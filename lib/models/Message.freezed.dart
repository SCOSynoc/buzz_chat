// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get message => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  String get messageType => throw _privateConstructorUsedError;
  bool get isSeen => throw _privateConstructorUsedError;
  String get msgUid => throw _privateConstructorUsedError;
  bool get isTyping => throw _privateConstructorUsedError;
  bool get isMe => throw _privateConstructorUsedError;
  DateTime get timeSent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {String message,
      String senderId,
      String receiverId,
      String messageType,
      bool isSeen,
      String msgUid,
      bool isTyping,
      bool isMe,
      DateTime timeSent});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? messageType = null,
    Object? isSeen = null,
    Object? msgUid = null,
    Object? isTyping = null,
    Object? isMe = null,
    Object? timeSent = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      msgUid: null == msgUid
          ? _value.msgUid
          : msgUid // ignore: cast_nullable_to_non_nullable
              as String,
      isTyping: null == isTyping
          ? _value.isTyping
          : isTyping // ignore: cast_nullable_to_non_nullable
              as bool,
      isMe: null == isMe
          ? _value.isMe
          : isMe // ignore: cast_nullable_to_non_nullable
              as bool,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String senderId,
      String receiverId,
      String messageType,
      bool isSeen,
      String msgUid,
      bool isTyping,
      bool isMe,
      DateTime timeSent});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? messageType = null,
    Object? isSeen = null,
    Object? msgUid = null,
    Object? isTyping = null,
    Object? isMe = null,
    Object? timeSent = null,
  }) {
    return _then(_$MessageImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      msgUid: null == msgUid
          ? _value.msgUid
          : msgUid // ignore: cast_nullable_to_non_nullable
              as String,
      isTyping: null == isTyping
          ? _value.isTyping
          : isTyping // ignore: cast_nullable_to_non_nullable
              as bool,
      isMe: null == isMe
          ? _value.isMe
          : isMe // ignore: cast_nullable_to_non_nullable
              as bool,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl(
      {required this.message,
      required this.senderId,
      required this.receiverId,
      required this.messageType,
      required this.isSeen,
      required this.msgUid,
      required this.isTyping,
      required this.isMe,
      required this.timeSent});

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final String message;
  @override
  final String senderId;
  @override
  final String receiverId;
  @override
  final String messageType;
  @override
  final bool isSeen;
  @override
  final String msgUid;
  @override
  final bool isTyping;
  @override
  final bool isMe;
  @override
  final DateTime timeSent;

  @override
  String toString() {
    return 'Message(message: $message, senderId: $senderId, receiverId: $receiverId, messageType: $messageType, isSeen: $isSeen, msgUid: $msgUid, isTyping: $isTyping, isMe: $isMe, timeSent: $timeSent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.isSeen, isSeen) || other.isSeen == isSeen) &&
            (identical(other.msgUid, msgUid) || other.msgUid == msgUid) &&
            (identical(other.isTyping, isTyping) ||
                other.isTyping == isTyping) &&
            (identical(other.isMe, isMe) || other.isMe == isMe) &&
            (identical(other.timeSent, timeSent) ||
                other.timeSent == timeSent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, senderId, receiverId,
      messageType, isSeen, msgUid, isTyping, isMe, timeSent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required final String message,
      required final String senderId,
      required final String receiverId,
      required final String messageType,
      required final bool isSeen,
      required final String msgUid,
      required final bool isTyping,
      required final bool isMe,
      required final DateTime timeSent}) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  String get message;
  @override
  String get senderId;
  @override
  String get receiverId;
  @override
  String get messageType;
  @override
  bool get isSeen;
  @override
  String get msgUid;
  @override
  bool get isTyping;
  @override
  bool get isMe;
  @override
  DateTime get timeSent;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
