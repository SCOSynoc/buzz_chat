// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RandomJoined.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RandomJoinedImpl _$$RandomJoinedImplFromJson(Map<String, dynamic> json) =>
    _$RandomJoinedImpl(
      joined: json['joined'] as bool,
      users: json['users'] == null
          ? null
          : Users.fromJson(json['users'] as Map<String, dynamic>),
      guest: json['guest'] == null
          ? null
          : Guest.fromJson(json['guest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RandomJoinedImplToJson(_$RandomJoinedImpl instance) =>
    <String, dynamic>{
      'joined': instance.joined,
      'users': instance.users,
      'guest': instance.guest,
    };
