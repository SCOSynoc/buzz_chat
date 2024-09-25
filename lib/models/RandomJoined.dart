import 'package:freezed_annotation/freezed_annotation.dart';

import 'Guest.dart';
import 'Users.dart';

part 'RandomJoined.g.dart';
part 'RandomJoined.freezed.dart';

@freezed
class RandomJoined with _$RandomJoined {
  const factory RandomJoined({
    required final bool joined,
    final Users? users,
    final Guest? guest,
  }) = _RandomJoined;

  factory RandomJoined.fromJson(Map<String,dynamic> json) => _$RandomJoinedFromJson(json);
}