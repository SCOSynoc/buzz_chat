import 'package:freezed_annotation/freezed_annotation.dart';

part 'Guest.freezed.dart';

part 'Guest.g.dart';

@freezed
class Guest with _$Guest  {
  const factory Guest({
    required String uid,
    required String guestIP,
    required String gender,
    required bool isOnline,
    required bool isAuthed,
  }) = _Guest;

  factory Guest.fromJson(Map<String, dynamic> json)
  => _$GuestFromJson(json);
}