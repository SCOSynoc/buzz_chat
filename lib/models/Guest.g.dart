// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuestImpl _$$GuestImplFromJson(Map<String, dynamic> json) => _$GuestImpl(
      uid: json['uid'] as String,
      guestIP: json['guestIP'] as String,
      gender: json['gender'] as String,
      isOnline: json['isOnline'] as bool,
      isAuthed: json['isAuthed'] as bool,
    );

Map<String, dynamic> _$$GuestImplToJson(_$GuestImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'guestIP': instance.guestIP,
      'gender': instance.gender,
      'isOnline': instance.isOnline,
      'isAuthed': instance.isAuthed,
    };
