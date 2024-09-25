import 'package:freezed_annotation/freezed_annotation.dart';

part "Users.freezed.dart";

part "Users.g.dart";

@freezed
class Users with _$Users  {
  const factory Users({
    required String userUid,
    required bool isOnline,
    required String gender,
    required List<String> friendsList,
    required String userName,
    required String userEmail,
    required bool isAuthed,
    required String? userIpAddress,
    required String? userImage,
    required List<String> friendsRequestList,
    required String userDeviceIp,
    required List<String> userInterest,
    required List<String> saveChats
  }) = _Users;

  factory Users.fromJson(Map<String, dynamic> json)
  => _$UsersFromJson(json);
}