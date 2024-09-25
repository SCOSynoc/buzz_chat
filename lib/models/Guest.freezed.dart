// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Guest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Guest _$GuestFromJson(Map<String, dynamic> json) {
  return _Guest.fromJson(json);
}

/// @nodoc
mixin _$Guest {
  String get uid => throw _privateConstructorUsedError;
  String get guestIP => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  bool get isAuthed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestCopyWith<Guest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestCopyWith<$Res> {
  factory $GuestCopyWith(Guest value, $Res Function(Guest) then) =
      _$GuestCopyWithImpl<$Res, Guest>;
  @useResult
  $Res call(
      {String uid,
      String guestIP,
      String gender,
      bool isOnline,
      bool isAuthed});
}

/// @nodoc
class _$GuestCopyWithImpl<$Res, $Val extends Guest>
    implements $GuestCopyWith<$Res> {
  _$GuestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? guestIP = null,
    Object? gender = null,
    Object? isOnline = null,
    Object? isAuthed = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      guestIP: null == guestIP
          ? _value.guestIP
          : guestIP // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthed: null == isAuthed
          ? _value.isAuthed
          : isAuthed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestImplCopyWith<$Res> implements $GuestCopyWith<$Res> {
  factory _$$GuestImplCopyWith(
          _$GuestImpl value, $Res Function(_$GuestImpl) then) =
      __$$GuestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String guestIP,
      String gender,
      bool isOnline,
      bool isAuthed});
}

/// @nodoc
class __$$GuestImplCopyWithImpl<$Res>
    extends _$GuestCopyWithImpl<$Res, _$GuestImpl>
    implements _$$GuestImplCopyWith<$Res> {
  __$$GuestImplCopyWithImpl(
      _$GuestImpl _value, $Res Function(_$GuestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? guestIP = null,
    Object? gender = null,
    Object? isOnline = null,
    Object? isAuthed = null,
  }) {
    return _then(_$GuestImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      guestIP: null == guestIP
          ? _value.guestIP
          : guestIP // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthed: null == isAuthed
          ? _value.isAuthed
          : isAuthed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestImpl implements _Guest {
  const _$GuestImpl(
      {required this.uid,
      required this.guestIP,
      required this.gender,
      required this.isOnline,
      required this.isAuthed});

  factory _$GuestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestImplFromJson(json);

  @override
  final String uid;
  @override
  final String guestIP;
  @override
  final String gender;
  @override
  final bool isOnline;
  @override
  final bool isAuthed;

  @override
  String toString() {
    return 'Guest(uid: $uid, guestIP: $guestIP, gender: $gender, isOnline: $isOnline, isAuthed: $isAuthed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.guestIP, guestIP) || other.guestIP == guestIP) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.isAuthed, isAuthed) ||
                other.isAuthed == isAuthed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, guestIP, gender, isOnline, isAuthed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestImplCopyWith<_$GuestImpl> get copyWith =>
      __$$GuestImplCopyWithImpl<_$GuestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestImplToJson(
      this,
    );
  }
}

abstract class _Guest implements Guest {
  const factory _Guest(
      {required final String uid,
      required final String guestIP,
      required final String gender,
      required final bool isOnline,
      required final bool isAuthed}) = _$GuestImpl;

  factory _Guest.fromJson(Map<String, dynamic> json) = _$GuestImpl.fromJson;

  @override
  String get uid;
  @override
  String get guestIP;
  @override
  String get gender;
  @override
  bool get isOnline;
  @override
  bool get isAuthed;
  @override
  @JsonKey(ignore: true)
  _$$GuestImplCopyWith<_$GuestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
