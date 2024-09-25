
import 'package:buzz_chat/models/Guest.dart';
import 'package:buzz_chat/models/Users.dart';
import 'package:flutter/cupertino.dart';

@immutable
sealed class AuthStates{}


class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {
  final bool loading;
  AuthLoading({required this.loading});
}

class AnonymousSignInSuccess extends AuthStates {
   final bool isGuest;
   AnonymousSignInSuccess({required this.isGuest});
}

class SignUpSuccess extends AuthStates {}

class SignUpFailure extends AuthStates {}

class SignInFailure extends AuthStates {}

class SignInSuccess extends AuthStates {}

class AnonymousSignInFailure extends AuthStates {}

class SignOutSuccess extends AuthStates {}

class AlreadyAuthenticated extends AuthStates {
    final bool authenticated ;
    AlreadyAuthenticated({required this.authenticated});
}

class UserOnlineStatus extends AuthStates {
  final bool isOnline;
  UserOnlineStatus({required this.isOnline});
}

class CheckGuestSuccess extends AuthStates {
   final bool isGuest;
   CheckGuestSuccess({required this.isGuest});
}

class GuestDeletedSuccess extends AuthStates {
  final bool deleted;
  GuestDeletedSuccess({required this.deleted});
}

class LocalCurrentUserDataReceived extends AuthStates {
  final Users user;
  LocalCurrentUserDataReceived({required this.user});
}

/// friend request states


class FriendRequestSent extends AuthStates {
  final bool alreadySent;
  FriendRequestSent({required this.alreadySent});
}

class RequestAccepted extends AuthStates {
  final bool acceptOrReject;
  RequestAccepted({required this.acceptOrReject});
}

class AlreadyAFriend extends AuthStates {
  final bool acceptOrReject;
  AlreadyAFriend({required this.acceptOrReject});
}