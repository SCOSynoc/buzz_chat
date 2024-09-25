// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Users _$UsersFromJson(Map<String, dynamic> json) {
  return _Users.fromJson(json);
}

/// @nodoc
mixin _$Users {
  String get userUid => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  List<String> get friendsList => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userEmail => throw _privateConstructorUsedError;
  bool get isAuthed => throw _privateConstructorUsedError;
  String? get userIpAddress => throw _privateConstructorUsedError;
  String? get userImage => throw _privateConstructorUsedError;
  List<String> get friendsRequestList => throw _privateConstructorUsedError;
  String get userDeviceIp => throw _privateConstructorUsedError;
  List<String> get userInterest => throw _privateConstructorUsedError;
  List<String> get saveChats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersCopyWith<Users> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersCopyWith<$Res> {
  factory $UsersCopyWith(Users value, $Res Function(Users) then) =
      _$UsersCopyWithImpl<$Res, Users>;
  @useResult
  $Res call(
      {String userUid,
      bool isOnline,
      String gender,
      List<String> friendsList,
      String userName,
      String userEmail,
      bool isAuthed,
      String? userIpAddress,
      String? userImage,
      List<String> friendsRequestList,
      String userDeviceIp,
      List<String> userInterest,
      List<String> saveChats});
}

/// @nodoc
class _$UsersCopyWithImpl<$Res, $Val extends Users>
    implements $UsersCopyWith<$Res> {
  _$UsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? isOnline = null,
    Object? gender = null,
    Object? friendsList = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? isAuthed = null,
    Object? userIpAddress = freezed,
    Object? userImage = freezed,
    Object? friendsRequestList = null,
    Object? userDeviceIp = null,
    Object? userInterest = null,
    Object? saveChats = null,
  }) {
    return _then(_value.copyWith(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      friendsList: null == friendsList
          ? _value.friendsList
          : friendsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      isAuthed: null == isAuthed
          ? _value.isAuthed
          : isAuthed // ignore: cast_nullable_to_non_nullable
              as bool,
      userIpAddress: freezed == userIpAddress
          ? _value.userIpAddress
          : userIpAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
      friendsRequestList: null == friendsRequestList
          ? _value.friendsRequestList
          : friendsRequestList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userDeviceIp: null == userDeviceIp
          ? _value.userDeviceIp
          : userDeviceIp // ignore: cast_nullable_to_non_nullable
              as String,
      userInterest: null == userInterest
          ? _value.userInterest
          : userInterest // ignore: cast_nullable_to_non_nullable
              as List<String>,
      saveChats: null == saveChats
          ? _value.saveChats
          : saveChats // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersImplCopyWith<$Res> implements $UsersCopyWith<$Res> {
  factory _$$UsersImplCopyWith(
          _$UsersImpl value, $Res Function(_$UsersImpl) then) =
      __$$UsersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userUid,
      bool isOnline,
      String gender,
      List<String> friendsList,
      String userName,
      String userEmail,
      bool isAuthed,
      String? userIpAddress,
      String? userImage,
      List<String> friendsRequestList,
      String userDeviceIp,
      List<String> userInterest,
      List<String> saveChats});
}

/// @nodoc
class __$$UsersImplCopyWithImpl<$Res>
    extends _$UsersCopyWithImpl<$Res, _$UsersImpl>
    implements _$$UsersImplCopyWith<$Res> {
  __$$UsersImplCopyWithImpl(
      _$UsersImpl _value, $Res Function(_$UsersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? isOnline = null,
    Object? gender = null,
    Object? friendsList = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? isAuthed = null,
    Object? userIpAddress = freezed,
    Object? userImage = freezed,
    Object? friendsRequestList = null,
    Object? userDeviceIp = null,
    Object? userInterest = null,
    Object? saveChats = null,
  }) {
    return _then(_$UsersImpl(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      friendsList: null == friendsList
          ? _value._friendsList
          : friendsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      isAuthed: null == isAuthed
          ? _value.isAuthed
          : isAuthed // ignore: cast_nullable_to_non_nullable
              as bool,
      userIpAddress: freezed == userIpAddress
          ? _value.userIpAddress
          : userIpAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
      friendsRequestList: null == friendsRequestList
          ? _value._friendsRequestList
          : friendsRequestList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userDeviceIp: null == userDeviceIp
          ? _value.userDeviceIp
          : userDeviceIp // ignore: cast_nullable_to_non_nullable
              as String,
      userInterest: null == userInterest
          ? _value._userInterest
          : userInterest // ignore: cast_nullable_to_non_nullable
              as List<String>,
      saveChats: null == saveChats
          ? _value._saveChats
          : saveChats // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersImpl implements _Users {
  const _$UsersImpl(
      {required this.userUid,
      required this.isOnline,
      required this.gender,
      required final List<String> friendsList,
      required this.userName,
      required this.userEmail,
      required this.isAuthed,
      required this.userIpAddress,
      required this.userImage,
      required final List<String> friendsRequestList,
      required this.userDeviceIp,
      required final List<String> userInterest,
      required final List<String> saveChats})
      : _friendsList = friendsList,
        _friendsRequestList = friendsRequestList,
        _userInterest = userInterest,
        _saveChats = saveChats;

  factory _$UsersImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersImplFromJson(json);

  @override
  final String userUid;
  @override
  final bool isOnline;
  @override
  final String gender;
  final List<String> _friendsList;
  @override
  List<String> get friendsList {
    if (_friendsList is EqualUnmodifiableListView) return _friendsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendsList);
  }

  @override
  final String userName;
  @override
  final String userEmail;
  @override
  final bool isAuthed;
  @override
  final String? userIpAddress;
  @override
  final String? userImage;
  final List<String> _friendsRequestList;
  @override
  List<String> get friendsRequestList {
    if (_friendsRequestList is EqualUnmodifiableListView)
      return _friendsRequestList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendsRequestList);
  }

  @override
  final String userDeviceIp;
  final List<String> _userInterest;
  @override
  List<String> get userInterest {
    if (_userInterest is EqualUnmodifiableListView) return _userInterest;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userInterest);
  }

  final List<String> _saveChats;
  @override
  List<String> get saveChats {
    if (_saveChats is EqualUnmodifiableListView) return _saveChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_saveChats);
  }

  @override
  String toString() {
    return 'Users(userUid: $userUid, isOnline: $isOnline, gender: $gender, friendsList: $friendsList, userName: $userName, userEmail: $userEmail, isAuthed: $isAuthed, userIpAddress: $userIpAddress, userImage: $userImage, friendsRequestList: $friendsRequestList, userDeviceIp: $userDeviceIp, userInterest: $userInterest, saveChats: $saveChats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersImpl &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality()
                .equals(other._friendsList, _friendsList) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.isAuthed, isAuthed) ||
                other.isAuthed == isAuthed) &&
            (identical(other.userIpAddress, userIpAddress) ||
                other.userIpAddress == userIpAddress) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            const DeepCollectionEquality()
                .equals(other._friendsRequestList, _friendsRequestList) &&
            (identical(other.userDeviceIp, userDeviceIp) ||
                other.userDeviceIp == userDeviceIp) &&
            const DeepCollectionEquality()
                .equals(other._userInterest, _userInterest) &&
            const DeepCollectionEquality()
                .equals(other._saveChats, _saveChats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userUid,
      isOnline,
      gender,
      const DeepCollectionEquality().hash(_friendsList),
      userName,
      userEmail,
      isAuthed,
      userIpAddress,
      userImage,
      const DeepCollectionEquality().hash(_friendsRequestList),
      userDeviceIp,
      const DeepCollectionEquality().hash(_userInterest),
      const DeepCollectionEquality().hash(_saveChats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersImplCopyWith<_$UsersImpl> get copyWith =>
      __$$UsersImplCopyWithImpl<_$UsersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersImplToJson(
      this,
    );
  }
}

abstract class _Users implements Users {
  const factory _Users(
      {required final String userUid,
      required final bool isOnline,
      required final String gender,
      required final List<String> friendsList,
      required final String userName,
      required final String userEmail,
      required final bool isAuthed,
      required final String? userIpAddress,
      required final String? userImage,
      required final List<String> friendsRequestList,
      required final String userDeviceIp,
      required final List<String> userInterest,
      required final List<String> saveChats}) = _$UsersImpl;

  factory _Users.fromJson(Map<String, dynamic> json) = _$UsersImpl.fromJson;

  @override
  String get userUid;
  @override
  bool get isOnline;
  @override
  String get gender;
  @override
  List<String> get friendsList;
  @override
  String get userName;
  @override
  String get userEmail;
  @override
  bool get isAuthed;
  @override
  String? get userIpAddress;
  @override
  String? get userImage;
  @override
  List<String> get friendsRequestList;
  @override
  String get userDeviceIp;
  @override
  List<String> get userInterest;
  @override
  List<String> get saveChats;
  @override
  @JsonKey(ignore: true)
  _$$UsersImplCopyWith<_$UsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
