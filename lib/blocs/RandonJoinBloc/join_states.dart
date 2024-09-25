import 'package:buzz_chat/models/Guest.dart';
import 'package:flutter/cupertino.dart';

import '../../models/RandomJoined.dart';
import '../../models/Users.dart';

@immutable
sealed class JoinStates {}


class JoinInitialState extends JoinStates {}

class JoinWithStrangerSuccess extends JoinStates {
  final String senderId;
  final String receiverId;
  JoinWithStrangerSuccess({required this.receiverId,required this.senderId});
}

class PleaseWaitToJoin extends JoinStates {
   final bool waiting;
   final bool isUserGuest;
   final bool userFound;
   final RandomJoined? randomJoined;
   PleaseWaitToJoin({required this.waiting,required this.isUserGuest,required this.userFound,this.randomJoined});
}

class UserJoinedData extends JoinStates {
  final Users? users;
  final Guest? guest;
  final String? message;
  UserJoinedData({this.guest,this.users,this.message,});
}

class RandomUserJoinedSuccess extends JoinStates {
    final String userJoinedId;
    final String senderId;
    final String receiverId;
    RandomUserJoinedSuccess({
      required this.senderId,
      required this.receiverId,
      required this.userJoinedId
    }
    );
}




class FailedToJoinRandomUser extends JoinStates {
  final String message;
  FailedToJoinRandomUser({required this.message});
}

class ChatRoomCreatedWithUsers extends JoinStates {
  final String randomUserId;
  final String currentUserId;
  final String chatroomId;
  ChatRoomCreatedWithUsers({required this.currentUserId,required this.randomUserId,required this.chatroomId,});
}
