
import 'package:buzz_chat/models/RandomJoined.dart';
import 'package:flutter/cupertino.dart';

@immutable
sealed class JoinEvents {}


class JoinRandomRequested extends JoinEvents {
  final String gender;
  final bool isOnline;
  final bool isGuest;
  JoinRandomRequested( {required this.gender,required this.isOnline,required this.isGuest,});
}

class GetRandomUserData extends JoinEvents{
   final RandomJoined randomJoined ;
   GetRandomUserData({required this.randomJoined,});
}

class GetRandomStrangerToJoin extends JoinEvents {
  final String gender;
  final bool isOnline;
  GetRandomStrangerToJoin({required this.gender,required this.isOnline});
}

