// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersImpl _$$UsersImplFromJson(Map<String, dynamic> json) => _$UsersImpl(
      userUid: json['userUid'] as String,
      isOnline: json['isOnline'] as bool,
      gender: json['gender'] as String,
      friendsList: (json['friendsList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
      isAuthed: json['isAuthed'] as bool,
      userIpAddress: json['userIpAddress'] as String?,
      userImage: json['userImage'] as String?,
      friendsRequestList: (json['friendsRequestList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userDeviceIp: json['userDeviceIp'] as String,
      userInterest: (json['userInterest'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      saveChats:
          (json['saveChats'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$UsersImplToJson(_$UsersImpl instance) =>
    <String, dynamic>{
      'userUid': instance.userUid,
      'isOnline': instance.isOnline,
      'gender': instance.gender,
      'friendsList': instance.friendsList,
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'isAuthed': instance.isAuthed,
      'userIpAddress': instance.userIpAddress,
      'userImage': instance.userImage,
      'friendsRequestList': instance.friendsRequestList,
      'userDeviceIp': instance.userDeviceIp,
      'userInterest': instance.userInterest,
      'saveChats': instance.saveChats,
    };
