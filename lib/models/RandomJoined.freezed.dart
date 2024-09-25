// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'RandomJoined.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RandomJoined _$RandomJoinedFromJson(Map<String, dynamic> json) {
  return _RandomJoined.fromJson(json);
}

/// @nodoc
mixin _$RandomJoined {
  bool get joined => throw _privateConstructorUsedError;
  Users? get users => throw _privateConstructorUsedError;
  Guest? get guest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RandomJoinedCopyWith<RandomJoined> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RandomJoinedCopyWith<$Res> {
  factory $RandomJoinedCopyWith(
          RandomJoined value, $Res Function(RandomJoined) then) =
      _$RandomJoinedCopyWithImpl<$Res, RandomJoined>;
  @useResult
  $Res call({bool joined, Users? users, Guest? guest});

  $UsersCopyWith<$Res>? get users;
  $GuestCopyWith<$Res>? get guest;
}

/// @nodoc
class _$RandomJoinedCopyWithImpl<$Res, $Val extends RandomJoined>
    implements $RandomJoinedCopyWith<$Res> {
  _$RandomJoinedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joined = null,
    Object? users = freezed,
    Object? guest = freezed,
  }) {
    return _then(_value.copyWith(
      joined: null == joined
          ? _value.joined
          : joined // ignore: cast_nullable_to_non_nullable
              as bool,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Users?,
      guest: freezed == guest
          ? _value.guest
          : guest // ignore: cast_nullable_to_non_nullable
              as Guest?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsersCopyWith<$Res>? get users {
    if (_value.users == null) {
      return null;
    }

    return $UsersCopyWith<$Res>(_value.users!, (value) {
      return _then(_value.copyWith(users: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GuestCopyWith<$Res>? get guest {
    if (_value.guest == null) {
      return null;
    }

    return $GuestCopyWith<$Res>(_value.guest!, (value) {
      return _then(_value.copyWith(guest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RandomJoinedImplCopyWith<$Res>
    implements $RandomJoinedCopyWith<$Res> {
  factory _$$RandomJoinedImplCopyWith(
          _$RandomJoinedImpl value, $Res Function(_$RandomJoinedImpl) then) =
      __$$RandomJoinedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool joined, Users? users, Guest? guest});

  @override
  $UsersCopyWith<$Res>? get users;
  @override
  $GuestCopyWith<$Res>? get guest;
}

/// @nodoc
class __$$RandomJoinedImplCopyWithImpl<$Res>
    extends _$RandomJoinedCopyWithImpl<$Res, _$RandomJoinedImpl>
    implements _$$RandomJoinedImplCopyWith<$Res> {
  __$$RandomJoinedImplCopyWithImpl(
      _$RandomJoinedImpl _value, $Res Function(_$RandomJoinedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joined = null,
    Object? users = freezed,
    Object? guest = freezed,
  }) {
    return _then(_$RandomJoinedImpl(
      joined: null == joined
          ? _value.joined
          : joined // ignore: cast_nullable_to_non_nullable
              as bool,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Users?,
      guest: freezed == guest
          ? _value.guest
          : guest // ignore: cast_nullable_to_non_nullable
              as Guest?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RandomJoinedImpl implements _RandomJoined {
  const _$RandomJoinedImpl({required this.joined, this.users, this.guest});

  factory _$RandomJoinedImpl.fromJson(Map<String, dynamic> json) =>
      _$$RandomJoinedImplFromJson(json);

  @override
  final bool joined;
  @override
  final Users? users;
  @override
  final Guest? guest;

  @override
  String toString() {
    return 'RandomJoined(joined: $joined, users: $users, guest: $guest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RandomJoinedImpl &&
            (identical(other.joined, joined) || other.joined == joined) &&
            (identical(other.users, users) || other.users == users) &&
            (identical(other.guest, guest) || other.guest == guest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, joined, users, guest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RandomJoinedImplCopyWith<_$RandomJoinedImpl> get copyWith =>
      __$$RandomJoinedImplCopyWithImpl<_$RandomJoinedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RandomJoinedImplToJson(
      this,
    );
  }
}

abstract class _RandomJoined implements RandomJoined {
  const factory _RandomJoined(
      {required final bool joined,
      final Users? users,
      final Guest? guest}) = _$RandomJoinedImpl;

  factory _RandomJoined.fromJson(Map<String, dynamic> json) =
      _$RandomJoinedImpl.fromJson;

  @override
  bool get joined;
  @override
  Users? get users;
  @override
  Guest? get guest;
  @override
  @JsonKey(ignore: true)
  _$$RandomJoinedImplCopyWith<_$RandomJoinedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
