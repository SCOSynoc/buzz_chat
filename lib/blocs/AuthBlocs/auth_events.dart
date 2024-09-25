
import 'package:flutter/cupertino.dart';

@immutable
sealed class AuthEvents {}

class AnonymousLogin extends AuthEvents {
  final String gender;
  AnonymousLogin({required this.gender});
}

class SignInRequested extends AuthEvents {

  final String email;
  final String password;

  SignInRequested({required this.password,required this.email});

}

class SignUpRequested extends AuthEvents {

  final String email;
  final String password;
  final String name;
  final String gender;

  SignUpRequested({
    required this.email,
    required this.name,
    required this.password,
    required this.gender,
  });
}


class AlreadyAuthenticatedCheck extends AuthEvents {}


class UpdateUserOnlineStatus extends AuthEvents {
   final bool isOnline;
   UpdateUserOnlineStatus({required this.isOnline});
}


class LogoutRequested extends AuthEvents {}

class CheckUserIsGuestOrNot extends AuthEvents {}


class DeleteAnonymousCurrentGuestUser extends AuthEvents {}

class GetUserDataFromLocalData extends AuthEvents {}

class SendFriendRequest extends AuthEvents {
  final String userId;
  final String friendId;
  SendFriendRequest({required this.friendId,required this.userId});
}

class AcceptFriendRequest extends AuthEvents {
  final String userId;
  final String friendId;
  AcceptFriendRequest({required this.friendId,required this.userId});
}

class RequestCheckIfAlreadyAFriend extends AuthEvents {
  final String userId;
  final String friendId;
  RequestCheckIfAlreadyAFriend({required this.friendId,required this.userId});
}


